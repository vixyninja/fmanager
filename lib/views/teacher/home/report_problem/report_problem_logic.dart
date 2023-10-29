import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fmanager/data/data.dart';
import 'package:fmanager/helpers/helpers.dart';
import 'package:fmanager/models/models.dart';
import 'package:get/get.dart';

class ReportProblemLogic extends GetxController {
  final RoomRepository roomRepository = Get.find<RoomRepository>();
  final CategoryRepository categoryRepository = Get.find<CategoryRepository>();

  late final TextEditingController roomController;
  late final TextEditingController descriptionController;

  late final RxList<CategoryModel> categories;

  @override
  void onInit() {
    super.onInit();
    roomController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    roomController.dispose();
    descriptionController.dispose();
  }

  void onSearchRoom(String query) async {
    DebounceHelper.debounce('search-room', const Duration(milliseconds: 500), () async {
      final Either<Exception, List<RoomModel>> either = await roomRepository.getRooms();

      either.fold((l) async {}, (r) async {});
    });
  }

  void getAllCategory() async {
    final Either<Exception, List<CategoryModel>> either = await categoryRepository.getCategories();

    either.fold((l) async {}, (r) async {
      categories = r.obs;
    });
  }
}
