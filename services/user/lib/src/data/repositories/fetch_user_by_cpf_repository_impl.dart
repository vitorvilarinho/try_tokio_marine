import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../domain/models/profile.dart';
import '../../domain/repositories/fetch_user_by_cpf_repository.dart';
import '../data_sources/data_source_service.dart';

class FetchUserByCpfRepositoryImpl implements FetchUserByCpfRepository {
  const FetchUserByCpfRepositoryImpl({
    required DataSourceService dataSourceService,
  }) : _dataSourceService = dataSourceService;

  final DataSourceService _dataSourceService;
  @override
  Future<Either<Failure, Profile>> call({
    required String cpf,
  }) =>
      _dataSourceService.fetchProfileByCpf(cpf: cpf);
}
