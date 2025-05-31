import 'package:dartz/dartz.dart';
import 'package:tut_app/data/network/requests.dart';

import '../../data/network/failure.dart';
import '../models/models.dart';

abstract class Repo {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
