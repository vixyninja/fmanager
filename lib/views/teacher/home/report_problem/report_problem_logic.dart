import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:fmanager/core/core.dart';
import 'package:fmanager/data/data.dart';
import 'package:fmanager/helpers/helpers.dart';
import 'package:fmanager/models/models.dart';
import 'package:fmanager/utils/utils.dart';
import 'package:fmanager/views/common/common.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:http_parser/http_parser.dart' as parser;
import 'package:image_picker/image_picker.dart';

class ReportProblemLogic extends BaseController {
  late final FeedBackRepository feedBackRepository;

  late final TextEditingController roomController;
  late final TextEditingController descriptionController;
  late final TextEditingController categoryController;
  late final RxList<XFile> images;
  late final RxList<CategoryModel> categories;
  late final RxList<RoomModel> rooms;
  late final ScrollController imageScrollController;

  @override
  void onInit() {
    super.onInit();
    feedBackRepository = Get.find<FeedBackRepository>();

    roomController = TextEditingController();
    descriptionController = TextEditingController();
    categoryController = TextEditingController();

    imageScrollController = ScrollController();

    images = List<XFile>.empty(growable: true).obs;
    categories = <CategoryModel>[].obs;
    rooms = <RoomModel>[].obs;

    addListeners();
  }

  @override
  onReady() {
    super.onReady();
    getAllCategory();
  }

  addListeners() {
    roomController.addListener(() {
      if (roomController.value.text.isNotEmpty) {
        DebounceHelper.debounce('SEARCH_ROOM', const Duration(milliseconds: 500), () async {
          await onSearchRoom(roomController.value.text);
        });
      }
    });
    descriptionController.addListener(() {});
    categoryController.addListener(() {});
  }

  onSearchRoom(String query) async {
    final Either<Exception, List<RoomModel>> either = await feedBackRepository.getRooms(query);
    either.fold((l) {
      rooms.clear();
    }, (r) {
      rooms.clear();
      rooms.addAll(r);
    });
  }

  void getAllCategory() async {
    final Either<Exception, List<CategoryModel>> either = await feedBackRepository.getCategories();
    either.fold((l) {}, (r) => categories.addAll(r));
  }

  captureImage() async {
    try {
      final XFile? image = await FileManager().pickImageFromCamera();
      if (image != null) {
        images.add(image);
      }
      await imageScrollController.animateTo(
          imageScrollController.position.maxScrollExtent + imageScrollController.position.viewportDimension,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease);
    } catch (e) {
      handleError(e as Exception);
    }
  }

  pickImages() async {
    try {
      final List<XFile> list = await FileManager().pickMultipleImage();
      images.addAll(list);
      await imageScrollController.animateTo(
          imageScrollController.position.maxScrollExtent + imageScrollController.position.viewportDimension,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease);
    } catch (e) {
      handleError(e as Exception);
    }
  }

  void postProblemRequest() async {
    validateForm();
    var room = rooms.firstWhere((element) => element.roomName == roomController.value.text);
    var category = categories.firstWhere((element) => element.categoryName == categoryController.value.text);
    var user = 'Huynh Hong Vy';

    var formData = dio.FormData.fromMap({
      'name_feed_back': 'Phản hồi từ $user',
      'room_id': room.id.toString(),
      'category_id': category.id.toString(),
      'description': descriptionController.value.text.toString(),
    });

    for (int i = 0; i < images.length; i++) {
      formData.files.add(MapEntry(
          'files',
          dio.MultipartFile.fromBytes(
            await images[i].readAsBytes(),
            filename: images[i].name,
            contentType: parser.MediaType('image', images[i].name.split('.').last),
          )));
    }

    final Either<Exception, ResponseModel> either = await feedBackRepository.createFeedback(formData);

    either.fold((l) {
      handleError(l);
    }, (r) {
      CommonDialog.showDefault('Thông báo', 'Gửi phản hồi thành công');
      images.clear();
      roomController.clear();
      descriptionController.clear();
      categoryController.clear();
      Get.back();
    });
  }

  validateForm() {
    if (roomController.value.text.isEmpty) {
      CommonDialog.showDefault('Lưu ý', 'Vui lòng chọn phòng');
      return;
    } else if (categoryController.value.text.isEmpty) {
      CommonDialog.showDefault('Lưu ý', 'Vui lòng chọn danh mục');
      return;
    } else if (descriptionController.value.text.isEmpty) {
      CommonDialog.showDefault('Lưu ý', 'Vui lòng nhập mô tả');
      return;
    }
  }
}
