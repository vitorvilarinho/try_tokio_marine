import '../../domain/repositories/sign_out_repository.dart';
import '../data_sources/data_source_service.dart';

/// Implementation of [SignOutRepository].
/// This class is responsible for handling the sign-out process.
/// It interacts with the [DataSourceService] to perform the sign-out
/// operation.
class SignOutRepositoryImpl implements SignOutRepository {
  /// Constructor for [SignOutRepositoryImpl].
  /// Takes a [DataSourceService] as a parameter.
  /// The [DataSourceService] is used to perform the sign-out operation.
  /// This class is part of the authentication service and is used to
  /// sign out users.
  const SignOutRepositoryImpl({
    required DataSourceService dataSourceService,
  }) : _dataSourceService = dataSourceService;

  /// The [DataSourceService] used to perform the sign-out operation.
  final DataSourceService _dataSourceService;

  /// Signs out the user.
  @override
  Future<void> call() => _dataSourceService.signOut();
}
