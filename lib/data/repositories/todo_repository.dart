import 'package:dartz/dartz.dart';
import 'package:fmanager/data/data.dart';
import 'package:fmanager/models/todo_model.dart';
import 'package:get/get.dart';

abstract class TodoRepository {
  Future<Either<List<TodoModel>, Exception>> fetchTodos();
}

class TodoRepositoryImpl implements TodoRepository {
  final ApiServices apiServices = Get.find<ApiServices>();

  @override
  Future<Either<List<TodoModel>, Exception>> fetchTodos() async {
    try {
      final response = await apiServices.dio.get('/todos');
      final data = response.data as List;
      final todos = data.map((e) => TodoModel.fromJson(e)).toList();
      return Left(todos);
    } catch (e) {
      return Right(FetchDataException(e.toString()));
    }
  }
}
