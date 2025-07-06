import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../domain/models/authentication_model.dart';
import '../../domain/models/sign_up_model.dart';
import '../../domain/repositories/sign_up_with_email_and_password_repository.dart';
import '../data_sources/data_source_service.dart';
import '../mappers/authentication_mapper.dart';
import '../models/data_models.dart';

/// /// Implementation of [SignUpWithEmailAndPasswordRepository].
/// This class is responsible for handling the sign-up process using email
/// and password.
/// It interacts with the [DataSourceService] to perform the sign-up
/// operation and maps the response to the [AuthenticationModel].
///
/// This class is part of the authentication service and is used to
/// authenticate users using their email and password.
/// It uses the [DataSourceService] to perform the actual sign-up
/// operation and maps the response to the [AuthenticationModel].
/// The class is designed to be used in a dependency injection context,
/// where the [DataSourceService] and [Mapper] can be provided
/// as dependencies.
/// It returns a [Future] that resolves to either a [Failure] or an
/// [AuthenticationModel].
/// The [Mapper] is used to convert the [AuthenticationResponse]
/// from the data source into the [AuthenticationModel] used in the
/// domain layer.
class SignUpWithEmailAndPasswordRepositoryImpl
    implements SignUpWithEmailAndPasswordRepository {
  /// Constructor for [SignUpWithEmailAndPasswordRepositoryImpl].
  /// Takes a [DataSourceService] and an optional [Mapper] as parameters.
  /// The [DataSourceService] is used to perform the sign-up operation,
  /// and the [Mapper] is used to convert the response to the
  /// [AuthenticationModel].
  const SignUpWithEmailAndPasswordRepositoryImpl({
    required DataSourceService dataSourceService,
    Mapper<AuthenticationResponse, AuthenticationModel>
        authenticationResponseMapper = const AuthenticationMapper(),
  })  : _dataSourceService = dataSourceService,
        _authenticationResponseMapper = authenticationResponseMapper;

  /// The [DataSourceService] used to perform the sign-up operation.
  final DataSourceService _dataSourceService;

  /// The [Mapper] is used to convert the [AuthenticationResponse]
  /// from the data source into the [AuthenticationModel] used in the
  /// domain layer.
  final Mapper<AuthenticationResponse, AuthenticationModel>
      _authenticationResponseMapper;

  /// Signs up a user with the given [signUpModel].
  @override
  Future<Either<Failure, AuthenticationModel>> call({
    required SignUpModel signUpModel,
  }) async {
    final result = await _dataSourceService.signUpWithEmailAndPassword(
      signUpRequest: SignUpRequest(
        authentication: AuthenticationRequest(
          email: signUpModel.email,
          password: signUpModel.password,
        ),
        firstName: signUpModel.firstName,
        lastName: signUpModel.lastName,
        cpf: signUpModel.cpf,
      ),
    );

    return result.fold(
      (failure) => Left(failure),
      (authenticationResponse) =>
          Right(_authenticationResponseMapper.cast(authenticationResponse)),
    );
  }
}
