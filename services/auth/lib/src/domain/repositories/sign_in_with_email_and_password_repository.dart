import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../models/authentication_model.dart';

abstract class SignInWithEmailAndPasswordRepository {
  Future<Either<Failure, AuthenticationModel>> call({
    required String email,
    required String password,
  });
}
