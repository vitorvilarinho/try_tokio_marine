import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../domain/models/authentication_model.dart';
import '../../domain/repositories/sign_in_with_email_and_password_repository.dart';
import '../data_sources/data_source_service.dart';
import '../mappers/authentication_mapper.dart';
import '../models/data_models.dart';

/// Implementation of [SignInWithEmailAndPasswordRepository].
/// This class is responsible for handling the sign-in process using email
/// and password.
/// It interacts with the [DataSourceService] to perform the sign-in
/// operation and maps the response to the [AuthenticationModel].
///
/// This class is part of the authentication service and is used to
/// authenticate users using their email and password.
/// It uses the [DataSourceService] to perform the actual sign-in
/// operation and maps the response to the [AuthenticationModel].
/// The class is designed to be used in a dependency injection context,
/// where the [DataSourceService] and [Mapper] can be provided
/// as dependencies.
/// It returns a [Future] that resolves to either a [Failure] or an
/// [AuthenticationModel].
/// The [Mapper] is used to convert the [AuthenticationResponse]
/// from the data source into the [AuthenticationModel] used in the
/// domain layer.
class SignInWithEmailAndPasswordRepositoryImpl
    implements SignInWithEmailAndPasswordRepository {
  /// Constructor for [SignInWithEmailAndPasswordRepositoryImpl].
  /// Takes a [DataSourceService] and an optional [Mapper] as parameters.
  /// The [DataSourceService] is used to perform the sign-in operation,
  /// and the [Mapper] is used to convert the response to the
  /// [AuthenticationModel].
  /// The [Mapper] defaults to [AuthenticationMapper].
  const SignInWithEmailAndPasswordRepositoryImpl({
    required DataSourceService dataSourceService,
    Mapper<AuthenticationResponse, AuthenticationModel> mapper =
        const AuthenticationMapper(),
  })  : _dataSourceService = dataSourceService,
        _mapper = mapper;

  /// The [DataSourceService] used to perform the sign-in operation.
  final DataSourceService _dataSourceService;

  /// The [Mapper] used to convert the response to the [AuthenticationModel].
  final Mapper<AuthenticationResponse, AuthenticationModel> _mapper;

  /// Signs in a user with the given email and password.
  /// Takes the [email] and [password] as parameters.
  /// Returns a [Future] that resolves to either a [Failure] or an
  /// [AuthenticationModel].
  /// The [Failure] represents an error that occurred during the sign-in
  /// operation, while the [AuthenticationModel] represents the
  /// authenticated user.
  /// The [Mapper] is used to convert the [AuthenticationResponse]
  /// from the data source into the [AuthenticationModel] used in the
  /// domain layer.
  @override
  Future<Either<Failure, AuthenticationModel>> call({
    required String email,
    required String password,
  }) async {
    final serviceResult = await _dataSourceService.signInWithEmailAndPassword(
      authenticationRequest: AuthenticationRequest(
        email: email,
        password: password,
      ),
    );

    return serviceResult.fold(
      (failure) => Left(failure),
      (authenticationResponse) => Right(_mapper.cast(authenticationResponse)),
    );
  }
}
