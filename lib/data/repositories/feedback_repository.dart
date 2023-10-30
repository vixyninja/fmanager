import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fmanager/data/agent.dart';
import 'package:fmanager/data/error_exceptions.dart';
import 'package:fmanager/models/models.dart';

abstract class FeedbackEndpoint {
  static const String createFeedback = '/feedback';
  static const String getRooms = '/room';
  static const String getCategories = '/category';
}

abstract class FeedBackRepository {
  Future<Either<Exception, List<RoomModel>>> getRooms(String? query);
  Future<Either<Exception, List<CategoryModel>>> getCategories();
  Future<Either<Exception, ResponseModel>> createFeedback(FormData createFeedbackModel);
}

class FeedbackRepositoryImpl implements FeedBackRepository {
  ApiServices apiServices;

  FeedbackRepositoryImpl({required this.apiServices});

  @override
  Future<Either<Exception, List<RoomModel>>> getRooms(String? query) async {
    try {
      final response = await apiServices.dio.get(FeedbackEndpoint.getRooms, queryParameters: {
        'room_name': query ?? '',
      });
      final ResponseModel responseModel = ResponseModel.fromJson(response.data);
      if (responseModel.statusCode == 200) {
        final dynamic rooms = responseModel.data.map<RoomModel>((e) => RoomModel.fromJson(e)).toList();
        return Right(rooms as List<RoomModel>);
      } else {
        return Left(BadRequestException());
      }
    } catch (e) {
      return Left(BadRequestException());
    }
  }

  @override
  Future<Either<Exception, List<CategoryModel>>> getCategories() async {
    try {
      final response = await apiServices.dio.get(FeedbackEndpoint.getCategories);
      final ResponseModel responseModel = ResponseModel.fromJson(response.data);

      if (responseModel.statusCode == 200) {
        final dynamic categories = responseModel.data.map<CategoryModel>((e) => CategoryModel.fromJson(e)).toList();
        return Right(categories as List<CategoryModel>);
      } else {
        return Left(BadRequestException());
      }
    } catch (e) {
      return Left(BadRequestException());
    }
  }

  @override
  Future<Either<Exception, ResponseModel>> createFeedback(FormData createFeedbackModel) async {
    try {
      final response = await apiServices.dio.post(
        FeedbackEndpoint.createFeedback,
        data: createFeedbackModel,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );
      final ResponseModel responseModel = ResponseModel.fromJson(response.data);
      if (responseModel.statusCode == 200) {
        return Right(responseModel);
      } else {
        return Left(BadRequestException());
      }
    } catch (e) {
      return Left(BadRequestException());
    }
  }
}
