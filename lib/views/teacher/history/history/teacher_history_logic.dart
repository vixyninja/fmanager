import 'package:fmanager/core/core.dart';
import 'package:fmanager/data/data.dart';
import 'package:fmanager/models/feedback_model.dart';
import 'package:get/get.dart';

class TeacherHistoryLogic extends BaseController {
  late final RxList<FeedBackModel> listFeedBack;
  late final FeedBackRepository feedBackRepository;

  @override
  void onInit() {
    super.onInit();
    listFeedBack = RxList<FeedBackModel>.empty(growable: true);
    feedBackRepository = Get.find<FeedBackRepository>();
  }

  @override
  onReady() {
    super.onReady();
    getAllHistoryFeedback();
  }

  navigateToProblemRequest(FeedBackModel feedBackModel) =>
      Get.toNamed(RouteKeys.teacherProblemRequestScreen, arguments: feedBackModel);

  getAllHistoryFeedback() async {
    showLoading();
    await feedBackRepository.getHistoryFeedback().then((value) {
      value.fold((l) => listFeedBack.addAll([]), (r) => listFeedBack.addAll(r));
      return value;
    }).whenComplete(() => hideLoading());
  }

  refreshLoading() async {
    showLoading();
    await feedBackRepository.getHistoryFeedback().then((value) {
      value.fold((l) => listFeedBack.addAll([]), (r) {
        listFeedBack.clear();
        listFeedBack.addAll(r);
      });
      return value;
    }).whenComplete(() => hideLoading());
  }
}
