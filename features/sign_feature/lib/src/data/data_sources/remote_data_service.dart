import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:db_firestore/db_firestore.dart';

import '../../domain/failures/user_not_found_failure.dart';
import 'data_source_service.dart';

class RemoteDataService implements DataSourceService {
  const RemoteDataService({
    required DbFirestoreService dbService,
    required AuthService authService,
  })  : _dbService = dbService,
        _authService = authService;

  final DbFirestoreService _dbService;
  final AuthService _authService;

  @override
  Future<Either<Failure, String>> fetchEmailByCpf({
    required String cpf,
  }) async {
    final user = await _dbService.fetchData(documentPath: 'users/$cpf');
    return user.fold(
      (failure) => Left(failure),
      (userMap) {
        if (userMap?.isEmpty ?? true) {
          return const Left(UserNotFoundFailure());
        }
        return Right(userMap!['email']);
      },
    );
  }

  @override
  Future<Either<Failure, AuthenticationModel>> signInWithEmailPassword({
    required String email,
    required String password,
  }) =>
      _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

  @override
  Future<Either<Failure, void>> signUpWithEmailPassword({
    required SignUpModel signUpModel,
  }) =>
      _authService.signUpWithEmailAndPassword(
        signUpModel: signUpModel,
      );
}
