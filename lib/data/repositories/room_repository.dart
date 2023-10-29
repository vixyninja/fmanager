import 'package:dartz/dartz.dart';
import 'package:fmanager/data/data.dart';
import 'package:fmanager/models/models.dart';

abstract class RoomEndpoint {
  static const String getRooms = '/room';
}

abstract class RoomRepository {
  Future<Either<Exception, List<RoomModel>>> getRooms();
}

class RoomRepositoryImpl implements RoomRepository {
  ApiServices apiServices;

  RoomRepositoryImpl({required this.apiServices});

  @override
  Future<Either<Exception, List<RoomModel>>> getRooms() async {
    try {
      final response = await apiServices.dio.get(RoomEndpoint.getRooms);
      final ResponseModel responseModel = ResponseModel.fromJson(response.data);
      if (responseModel.statusCode == 200) {
        final rooms = responseModel.data.map<RoomModel>((e) => RoomModel.fromJson(e)).toList();
        return Right(rooms);
      } else {
        return Left(BadRequestException());
      }
    } catch (e) {
      return Left(BadRequestException());
    }
  }
}
