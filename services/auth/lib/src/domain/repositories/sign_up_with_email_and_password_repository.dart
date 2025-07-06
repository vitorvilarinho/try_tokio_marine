import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../models/authentication_model.dart';
import '../models/sign_up_model.dart';

abstract class SignUpWithEmailAndPasswordRepository {
  Future<Either<Failure, AuthenticationModel>> call({
    required SignUpModel signUpModel,
  });
}
