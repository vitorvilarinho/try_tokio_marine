import '../repositories/verify_if_have_authenticate_user_repository.dart';

class VerifyIfHaveAuthenticateUserUsecase {
  const VerifyIfHaveAuthenticateUserUsecase({
    required VerifyIfHaveAuthenticateUserRepository
        verifyIfHaveAuthenticateUserRepository,
  }) : _verifyIfHaveAuthenticateUserRepository =
            verifyIfHaveAuthenticateUserRepository;

  final VerifyIfHaveAuthenticateUserRepository
      _verifyIfHaveAuthenticateUserRepository;

  Future<bool> call() => _verifyIfHaveAuthenticateUserRepository();
}
