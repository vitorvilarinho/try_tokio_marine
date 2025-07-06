import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/fetch_email_by_cpf_repository.dart';
import '../data_sources/data_source_service.dart';

class FetchEmailByCpfRepositoryImpl implements FetchEmailByCpfRepository {
  const FetchEmailByCpfRepositoryImpl({
    required DataSourceService dataSource,
  }) : _dataSource = dataSource;

  final DataSourceService _dataSource;

  @override
  Future<Either<Failure, String>> call({required String cpf}) =>
      _dataSource.fetchEmailByCpf(cpf: cpf);
}
