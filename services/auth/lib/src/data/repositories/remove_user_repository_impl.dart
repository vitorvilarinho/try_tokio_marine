import '../../domain/repositories/remove_user_repository.dart';
import '../data_sources/data_source_service.dart';

class RemoveUserRepositoryImpl implements RemoveUserRepository {
  const RemoveUserRepositoryImpl({
    required DataSourceService dataSourceService,
  }) : _dataSourceService = dataSourceService;

  final DataSourceService _dataSourceService;
  @override
  Future<void> call() => _dataSourceService.removeUser();
}
