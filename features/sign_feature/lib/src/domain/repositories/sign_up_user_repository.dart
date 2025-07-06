import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpUserRepository {
  Future<Either<Failure, void>> call({
    required SignUpModel signUpModel,
  });
}
