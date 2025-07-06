import 'package:auth/src/data/data_sources/data_source_service.dart';
import 'package:auth/src/data/models/data_models.dart';
import 'package:auth/src/data/repositories/sign_up_with_email_and_password_repository_impl.dart';
import 'package:auth/src/domain/failures/failures.dart';
import 'package:auth/src/domain/models/models.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../seeds.dart';

void main() {
  late DataSourceService dataSourceService;

  late SignUpWithEmailAndPasswordRepositoryImpl repository;
  late SignUpRequest signUpRequest;
  late SignUpModel signUpModel;
  late AuthenticationResponse authenticationResponse;

  setUp(() {
    dataSourceService = MockDataSourceService();

    repository = SignUpWithEmailAndPasswordRepositoryImpl(
      dataSourceService: dataSourceService,
    );
  });

  setUpAll(() {
    signUpRequest = const SignUpRequest(
        authentication: AuthenticationRequest(
          email: Seeds.email,
          password: Seeds.password,
        ),
        firstName: Seeds.firstName,
        lastName: Seeds.lastName,
        cpf: Seeds.cpf);

    signUpModel = const SignUpModel(
      firstName: Seeds.firstName,
      lastName: Seeds.lastName,
      cpf: Seeds.cpf,
      password: Seeds.password,
      email: Seeds.email,
    );
    authenticationResponse = AuthenticationResponse(
      uid: 'uid',
      email: 'name@server.com.br',
      authToken: AuthenticationTokenResult(
        authTime: DateTime.now(),
        expirationTime: DateTime.now(),
        issuedAtTime: DateTime.now(),
        signInProvider: 'email',
        token: 'token',
        refreshToken: 'refreshToken',
      ),
    );

    registerFallbackValue(signUpRequest);
    registerFallbackValue(signUpModel);
    registerFallbackValue(authenticationResponse);
  });

  test('should return AuthenticationModel on success', () async {
    when(() => dataSourceService.signUpWithEmailAndPassword(
            signUpRequest: any(named: 'signUpRequest')))
        .thenAnswer((_) async => Right(authenticationResponse));

    final result = await repository.call(signUpModel: signUpModel);

    expect(result.isRight(), true);
    expect(
      result.fold(
        (l) => l,
        (r) => r,
      ),
      isA<AuthenticationModel>(),
    );
    verify(() => dataSourceService.signUpWithEmailAndPassword(
        signUpRequest: signUpRequest)).called(1);
  });

  test('should return Failure on error', () async {
    when(() => dataSourceService.signUpWithEmailAndPassword(
            signUpRequest: any(named: 'signUpRequest')))
        .thenAnswer((_) async => const Left(WeakPasswordFailure()));

    final result = await repository.call(signUpModel: signUpModel);

    expect(result.isLeft(), true);
    expect(result.fold((l) => l, (r) => r), isA<Failure>());
    verify(() => dataSourceService.signUpWithEmailAndPassword(
        signUpRequest: signUpRequest)).called(1);
  });

  test('should use default AuthenticationMapper if not provided', () async {
    final repoWithDefaultMapper = SignUpWithEmailAndPasswordRepositoryImpl(
      dataSourceService: dataSourceService,
    );
    when(() => dataSourceService.signUpWithEmailAndPassword(
            signUpRequest: any(named: 'signUpRequest')))
        .thenAnswer((_) async => Right(authenticationResponse));

    final result = await repoWithDefaultMapper.call(signUpModel: signUpModel);

    expect(result.isRight(), true);
    expect(
      result.fold(
        (l) => l,
        (r) => r,
      ),
      isA<AuthenticationModel>(),
    );
  });
}
