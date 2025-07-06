import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:user/user.dart';

import '../models/authentication_model.dart';
import '../models/sign_up_model.dart';
import '../repositories/remove_user_repository.dart';
import '../repositories/sign_up_with_email_and_password_repository.dart';

class SignUpWithEmailAndPasswordUsecase {
  const SignUpWithEmailAndPasswordUsecase({
    required SignUpWithEmailAndPasswordRepository
        signUpWithEmailAndPasswordRepository,
    required RemoveUserRepository removeUserRepository,
    required UserService userService,
  })  : _signUpWithEmailAndPasswordRepository =
            signUpWithEmailAndPasswordRepository,
        _removeUserRepository = removeUserRepository,
        _userService = userService;

  final SignUpWithEmailAndPasswordRepository
      _signUpWithEmailAndPasswordRepository;
  final RemoveUserRepository _removeUserRepository;
  final UserService _userService;

  Future<Either<Failure, AuthenticationModel>> call({
    required SignUpModel signUpModel,
  }) async {
    final result = await _signUpWithEmailAndPasswordRepository(
      signUpModel: signUpModel,
    );
    return result.fold(
      (failure) => Left(failure),
      (authentication) async {
        final profileUser = await _userService.saveProfile(
          profile: Profile(
            uid: authentication.uid,
            firstName: signUpModel.firstName,
            lastName: signUpModel.lastName,
            email: signUpModel.email,
            cpf: signUpModel.cpf,
          ),
        );

        return profileUser.fold(
          (failure) async {
            await _removeUserRepository();
            return Left(failure);
          },
          (_) => Right(authentication),
        );
      },
    );
  }
}
