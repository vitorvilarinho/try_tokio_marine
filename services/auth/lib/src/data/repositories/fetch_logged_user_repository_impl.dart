import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:user/user.dart';

import '../../domain/repositories/fetch_logged_user_repository.dart';
import '../data_sources/data_source_service.dart';

class FetchLoggedUserRepositoryImpl implements FetchLoggedUserRepository {
  const FetchLoggedUserRepositoryImpl({
    required DataSourceService dataSourceService,
  }) : _dataSourceService = dataSourceService;

  final DataSourceService _dataSourceService;

  @override
  Future<Either<Failure, Profile>> call() =>
      _dataSourceService.fetchLoggedUser();
}
