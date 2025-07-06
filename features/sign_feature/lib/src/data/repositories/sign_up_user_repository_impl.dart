import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/repositories.dart';
import '../data_sources/data_source_service.dart';

class SignUpUserRepositoryImpl implements SignUpUserRepository {
  const SignUpUserRepositoryImpl({
    required DataSourceService dataSource,
  }) : _dataSource = dataSource;

  final DataSourceService _dataSource;

  @override
  Future<Either<Failure, void>> call({required SignUpModel signUpModel}) =>
      _dataSource.signUpWithEmailPassword(signUpModel: signUpModel);
}
