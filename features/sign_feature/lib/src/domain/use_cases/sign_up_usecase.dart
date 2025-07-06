import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../repositories/repositories.dart';

class SignUpUsecase {
  const SignUpUsecase({
    required SignUpUserRepository signUpUserRepository,
  }) : _signUpUserRepository = signUpUserRepository;

  final SignUpUserRepository _signUpUserRepository;

  Future<Either<Failure, void>> call({
    required SignUpModel signUpModel,
  }) async {
    final signUp = await _signUpUserRepository(signUpModel: signUpModel);

    return signUp.fold(
      (failure) => Left(failure),
      (_) => const Right(null),
    );
  }
}
