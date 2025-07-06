import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../models/authentication_model.dart';
import '../repositories/sign_in_with_email_and_password_repository.dart';

class SignInWithEmailAndPasswordUsecase {
  const SignInWithEmailAndPasswordUsecase({
    required SignInWithEmailAndPasswordRepository repository,
  }) : _repository = repository;

  final SignInWithEmailAndPasswordRepository _repository;

  Future<Either<Failure, AuthenticationModel>> call({
    required String email,
    required String password,
  }) =>
      _repository(
        email: email,
        password: password,
      );
}
