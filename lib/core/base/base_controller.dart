import 'package:fmanager/data/error_exceptions.dart';
import 'package:fmanager/views/common/common.dart';
import 'package:fmanager/views/widgets/loading/loading_logic.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  static final List<String> injection = <String>[];

  final LoadingLogic loadingLogic = Get.find<LoadingLogic>();

  void handleError(Exception e) {
    switch (e.runtimeType) {
      case ErrorExceptions:
        CommonDialog.showDefault('Error', e.toString());
        break;
      case FetchDataException:
        CommonDialog.showDefault('Error', e.toString());
        break;
      case BadRequestException:
        CommonDialog.showDefault('Error', e.toString());
        break;
      case UnauthorisedException:
        CommonDialog.showDefault('Error', e.toString());
        break;
      case InvalidInputException:
        CommonDialog.showDefault('Error', e.toString());
        break;
      default:
        CommonDialog.showDefault('Error', e.toString());
    }
  }

  void showLoading() => loadingLogic.showLoading();

  void hideLoading() => loadingLogic.hideLoading();

  void showLoadingWithTitle(String title) => loadingLogic.showLoadingWithTitle(title: title);

  void showLoadingWith(Function function) {
    showLoading();
    function();
    hideLoading();
  }

  void showLoadingWithAsync(Function function) async {
    showLoading();
    await function();
    hideLoading();
  }

  void showLoadingWithAsyncAndCatch(Function function) async {
    showLoading();
    await function().catchError((e) {
      handleError(e);
    }).whenComplete(() {
      hideLoading();
    });
  }

  @override
  void onInit() {
    super.onInit();
    print('------------------------onInit----------------$runtimeType');
    injection.add(runtimeType.toString());
    print('------------------------List injection----------------$injection');
  }

  @override
  void onClose() {
    print('=====================onClose=====================$runtimeType');
    injection.remove(runtimeType.toString());
    print('=====================List injection=====================$injection');
    super.onClose();
  }
}
