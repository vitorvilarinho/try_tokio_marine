import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../repositories/repositories.dart';

class SignInUsecase {
  const SignInUsecase({
    required FetchEmailByCpfRepository fetchEmailByCpfRepository,
    required SignInWithEmailPasswordRepository
        signInWithEmailPasswordRepository,
  })  : _fetchEmailByCpfRepository = fetchEmailByCpfRepository,
        _signInWithEmailPasswordRepository = signInWithEmailPasswordRepository;

  final FetchEmailByCpfRepository _fetchEmailByCpfRepository;
  final SignInWithEmailPasswordRepository _signInWithEmailPasswordRepository;

  Future<Either<Failure, AuthenticationModel>> call({
    required String cpf,
    required String password,
  }) async {
    final user = await _fetchEmailByCpfRepository(cpf: cpf);

    return user.fold(
      (failure) => Left(failure),
      (emailAddress) {
        return _signInWithEmailPasswordRepository(
          email: emailAddress,
          password: password,
        );
      },
    );
  }
}
