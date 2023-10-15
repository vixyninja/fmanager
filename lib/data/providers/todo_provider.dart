import 'package:dartz/dartz.dart';
import 'package:fmanager/data/repositories/repositories.dart';
import 'package:fmanager/models/models.dart';

class TodoProvider {
  final TodoRepository todoRepository;

  TodoProvider({required this.todoRepository});

  Future<List<TodoModel>> fetchTodos() async {
    final Either<List<TodoModel>, Exception> result = await todoRepository.fetchTodos();
    return result.fold((List<TodoModel> todos) {
      return todos;
    }, (Exception exception) {
      print('TodoProvider Error: $exception');
      return [];
    });
  }
}
