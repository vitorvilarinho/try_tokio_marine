import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/sign_in_with_email_password_repository.dart';
import '../data_sources/data_source_service.dart';

class SignInWithEmailPasswordRepositoryImpl
    implements SignInWithEmailPasswordRepository {
  const SignInWithEmailPasswordRepositoryImpl({
    required DataSourceService dataSource,
  }) : _dataSource = dataSource;

  final DataSourceService _dataSource;

  @override
  Future<Either<Failure, AuthenticationModel>> call({
    required String email,
    required String password,
  }) =>
      _dataSource.signInWithEmailPassword(
        email: email,
        password: password,
      );
}
