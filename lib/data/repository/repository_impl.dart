import 'package:dartz/dartz.dart';
import 'package:tut_app/data/data_source/remote_data_source.dart';
import 'package:tut_app/data/mapper/mapper.dart';
import 'package:tut_app/data/network/failure.dart';
import 'package:tut_app/data/network/network_info.dart';
import 'package:tut_app/data/network/requests.dart';
import 'package:tut_app/domain/models/models.dart';
import 'package:tut_app/domain/repos/repo.dart';

class RepositoryImpl implements Repo {
  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      final Response = await _remoteDataSource.login(loginRequest);
      if (Response.status == 0) {
        // success
        // return either right
        // return data
        return right(Response.toDomain());
      } else {
        // failuer -- return business error
        // return either left
        return left(Failure(409, Response.message ?? 'business error message'));
      }
    } else {
      // return internet connection error
      // return either left
      return left(Failure(501, 'please check your internet'));
    }
  }
}
