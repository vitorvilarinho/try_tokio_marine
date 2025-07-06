import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class SignInWithEmailPasswordRepository {
  Future<Either<Failure, AuthenticationModel>> call({
    required String email,
    required String password,
  });
}
