import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:fmanager/core/core.dart';
import 'package:fmanager/data/data.dart';
import 'package:fmanager/models/models.dart';
import 'package:fmanager/utils/utils.dart';
import 'package:fmanager/views/common/common.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart' as parser;
import 'package:image_picker/image_picker.dart';

class ReportProblemLogic extends BaseController {
  late final FeedBackRepository feedBackRepository;

  late final TextEditingController roomController;
  late final TextEditingController descriptionController;
  late final TextEditingController categoryController;
  late final RxList<XFile> images;
  late final RxList<CategoryModel> categories;
  late final Rx<RoomModel> room;
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
    room = Rx(RoomModel.createEmpty());
  }

  @override
  onReady() {
    super.onReady();
    getAllCategory();
  }

  Future<List<RoomModel>?> onSearchRoom(String query) async =>
      await feedBackRepository.getRooms(query).then((value) => value.fold((l) => [], (r) => r));

  void getAllCategory() async {
    await feedBackRepository.getCategories().then((value) {
      value.fold((l) => categories.addAll([]), (r) => categories.addAll(r));
      return value;
    });
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
    showLoadingWithTitle('Đang gửi phản hồi');
    var category = categories.firstWhere((element) => element.categoryName == categoryController.value.text);
    var user = 'Huynh Hong Vy';

    var formData = dio.FormData.fromMap({
      'name_feed_back': 'Phản hồi từ $user',
      'room_id': room.value.id.toString(),
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
        ),
      ));
    }

    await feedBackRepository
        .createFeedback(formData)
        .then((value) => value.fold((l) => handleError(l),
            (r) => CommonDialog.showDefault('Thông báo', 'Gửi phản hồi thành công', () => Get.back())))
        .whenComplete(() => hideLoading());
  }

  validateForm() {
    if (roomController.value.text.isEmpty) {
      CommonDialog.showDefault('Lưu ý', 'Vui lòng chọn phòng', () => Get.back());
      return;
    } else if (categoryController.value.text.isEmpty) {
      CommonDialog.showDefault('Lưu ý', 'Vui lòng chọn danh mục', () => Get.back());
      return;
    } else if (descriptionController.value.text.isEmpty) {
      CommonDialog.showDefault('Lưu ý', 'Vui lòng nhập mô tả', () => Get.back());
      return;
    }
  }
}
