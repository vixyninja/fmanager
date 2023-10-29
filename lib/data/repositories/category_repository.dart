import 'package:dartz/dartz.dart';
import 'package:fmanager/data/data.dart';
import 'package:fmanager/models/models.dart';

abstract class CategoryEndpoint {
  static const String getCategories = '/category';
}

abstract class CategoryRepository {
  Future<Either<Exception, List<CategoryModel>>> getCategories();
}

class CategoryRepositoryImpl implements CategoryRepository {
  ApiServices apiServices;

  CategoryRepositoryImpl({required this.apiServices});

  @override
  Future<Either<Exception, List<CategoryModel>>> getCategories() async {
    try {
      final response = await apiServices.dio.get(CategoryEndpoint.getCategories);
      final ResponseModel responseModel = ResponseModel.fromJson(response.data);
      if (responseModel.statusCode == 200) {
        final categories = responseModel.data.map((e) => CategoryModel.fromJson(e)).toList();
        return Right(categories);
      } else {
        return Left(BadRequestException());
      }
    } catch (e) {
      return Left(BadRequestException());
    }
  }
}
