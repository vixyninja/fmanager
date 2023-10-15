import 'package:fmanager/data/providers/provider.dart';
import 'package:get/get.dart';

class TeacherHomeLogic extends GetxController {
  final TodoProvider todoProvider = Get.find<TodoProvider>();

  onCallApi() async {
    await todoProvider.fetchTodos();
  }
}
