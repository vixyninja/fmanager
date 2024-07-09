import 'package:fmanager/core/core.dart';
import 'package:fmanager/models/models.dart';
import 'package:get/get.dart';

class ProblemRequestLogic extends BaseController {
  late final Rx<FeedBackModel> feedBack = Rx<FeedBackModel>(FeedBackModel.createEmpty());

  @override
  void onInit() {
    super.onInit();
    feedBack.value = Get.arguments as FeedBackModel;
  }
}
