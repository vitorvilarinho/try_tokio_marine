import '../../domain/repositories/verify_if_have_authenticate_user_repository.dart';
import '../data_sources/data_source_service.dart';

/// Implementation of [VerifyIfHaveAuthenticateUserRepository].
/// This class is responsible for verifying if there is an authenticated
/// user in the system.
/// It interacts with the [DataSourceService] to check if a user is
/// authenticated.
/// This class is part of the authentication service and is used to
/// verify if a user is authenticated.
/// It uses the [DataSourceService] to perform the actual check.
/// The class is designed to be used in a dependency injection context,
/// where the [DataSourceService] can be provided as a dependency.
/// It returns a [Future] that resolves to a boolean value indicating
/// whether there is an authenticated user or not.
/// The [DataSourceService] is used to check if a user is authenticated.
/// The [call] method is used to perform the check.
/// The [call] method returns a [Future] that resolves to a boolean value
/// indicating whether there is an authenticated user or not.
class VerifyIfHaveAuthenticatedUserRepositoryImpl
    implements VerifyIfHaveAuthenticateUserRepository {
  /// Constructor for [VerifyIfHaveAuthenticatedUserRepositoryImpl].
  /// Takes a [DataSourceService] as a parameter.
  /// The [DataSourceService] is used to check if a user is authenticated.
  /// This class is part of the authentication service and is used to
  /// verify if a user is authenticated.
  /// It uses the [DataSourceService] to perform the actual check.
  /// The class is designed to be used in a dependency injection context,
  /// where the [DataSourceService] can be provided as a dependency.
  /// It returns a [Future] that resolves to a boolean value indicating
  /// whether there is an authenticated user or not.
  const VerifyIfHaveAuthenticatedUserRepositoryImpl({
    required DataSourceService dataSourceService,
  }) : _dataSourceService = dataSourceService;

  /// The [DataSourceService] used to check if a user is authenticated.
  final DataSourceService _dataSourceService;

  /// Checks if there is an authenticated user.
  /// Returns a [Future] that resolves to a boolean value indicating
  /// whether there is an authenticated user or not.
  /// The [call] method is used to perform the check.
  /// The [call] method returns a [Future] that resolves to a boolean value
  /// indicating whether there is an authenticated user or not.
  @override
  Future<bool> call() => _dataSourceService.hasUser();
}
