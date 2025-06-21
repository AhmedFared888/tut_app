import 'package:dartz/dartz.dart';
import 'package:tut_app/data/network/failure.dart';
import 'package:tut_app/data/network/requests.dart';
import 'package:tut_app/domain/models/models.dart';
import 'package:tut_app/domain/repos/repo.dart';
import 'package:tut_app/domain/usecase/base_usease.dart';

class LoginUsecase implements BaseUsecase<LoginUsecaseInput, Authentication> {
  final Repo _repo;
  LoginUsecase(this._repo);
  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUsecaseInput input) async {
    return await _repo.login(LoginRequest(input.email, input.password));
  }
}

class LoginUsecaseInput {
  String email;
  String password;
  LoginUsecaseInput(this.email, this.password);
}
