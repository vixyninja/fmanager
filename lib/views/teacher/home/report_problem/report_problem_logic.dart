import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fmanager/data/data.dart';
import 'package:fmanager/helpers/helpers.dart';
import 'package:fmanager/models/models.dart';
import 'package:get/get.dart';

class ReportProblemLogic extends GetxController {
  final FeedBackRepository feedBackRepository = Get.find<FeedBackRepository>();

  final TextEditingController roomController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    roomController.addListener(() {
      onSearchRoom(roomController.text);
    });
    descriptionController.addListener(() {});
    getAllCategory();
  }

  void onSearchRoom(String query) async {
    DebounceHelper.debounce('search-room', const Duration(milliseconds: 500), () async {
      final Either<Exception, List<RoomModel>> either = await feedBackRepository.getRooms();
      either.fold((l) {}, (r) {});
    });
  }

  void getAllCategory() async {
    final Either<Exception, List<CategoryModel>> either = await feedBackRepository.getCategories();
    either.fold((l) {}, (r) => categories.addAll(r));
  }
}
