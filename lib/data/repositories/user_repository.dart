import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fmanager/data/data.dart';
import 'package:fmanager/models/models.dart';

abstract class UserEndpoint {
  static const String loginGoogleGolang = '/auth/login';
  static const String getMyProfile = '/user';
}

abstract class UserRepository {
  Future<Either<Exception, TokenModel>> loginGoogleGolang({required String idToken, required String position});
  Future<Either<Exception, UserModel>> getMyProfile();
}

class UserRepositoryImpl implements UserRepository {
  final ApiServices apiServices;

  UserRepositoryImpl({required this.apiServices});

  @override
  Future<Either<Exception, UserModel>> getMyProfile() async {
    try {
      final response = await apiServices.dio.get(UserEndpoint.getMyProfile);
      final ResponseModel responseModel = ResponseModel.fromJson(response.data);
      if (responseModel.statusCode == 200) {
        final user = UserModel.fromJson(responseModel.data);
        return Right(user);
      } else {
        return Left(BadRequestException());
      }
    } catch (e) {
      return Left(BadRequestException());
    }
  }

  @override
  Future<Either<Exception, TokenModel>> loginGoogleGolang({required String idToken, required String position}) async {
    try {
      final response = await apiServices.dio
          .post(UserEndpoint.loginGoogleGolang, data: jsonEncode({'idToken': idToken, 'position': position}));
      final ResponseModel responseModel = ResponseModel.fromJson(response.data);
      if (responseModel.statusCode == 200) {
        final token = TokenModel.fromJson(responseModel.data);
        return Right(token);
      } else {
        return Left(BadRequestException());
      }
    } catch (e) {
      return Left(BadRequestException());
    }
  }
}
