import '../repositories/sign_out_repository.dart';

class SignOutUsecase {
  const SignOutUsecase({
    required SignOutRepository signOutRepository,
  }) : _signOutRepository = signOutRepository;

  final SignOutRepository _signOutRepository;

  Future<void> call() => _signOutRepository();
}
