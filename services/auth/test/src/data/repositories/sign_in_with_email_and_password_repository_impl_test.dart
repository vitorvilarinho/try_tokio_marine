import 'package:auth/src/data/data_sources/data_source_service.dart';
import 'package:auth/src/data/models/data_models.dart';
import 'package:auth/src/data/repositories/sign_in_with_email_and_password_repository_impl.dart';
import 'package:auth/src/domain/failures/failures.dart';
import 'package:auth/src/domain/models/models.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late DataSourceService dataSourceService;
  late SignInWithEmailAndPasswordRepositoryImpl repository;

  setUp(() {
    dataSourceService = MockDataSourceService();

    repository = SignInWithEmailAndPasswordRepositoryImpl(
      dataSourceService: dataSourceService,
    );
  });

  const testEmail = 'test@example.com';
  const testPassword = 'password123';

  const authenticationRequest = AuthenticationRequest(
    email: testEmail,
    password: testPassword,
  );
  final authenticationResponse = AuthenticationResponse(
      uid: 'uid',
      email: testEmail,
      authToken: AuthenticationTokenResult(authTime: DateTime.now()));

  group('SignInWithEmailAndPasswordRepositoryImpl', () {
    test('should return AuthenticationModel when sign in succeeds', () async {
      when(() => dataSourceService.signInWithEmailAndPassword(
            authenticationRequest: authenticationRequest,
          )).thenAnswer((_) async => Right(authenticationResponse));

      final result = await repository(
        email: testEmail,
        password: testPassword,
      );

      expect(result.isRight(), isTrue);
      expect(
        result.fold(
          (l) => l,
          (r) => r,
        ),
        isA<AuthenticationModel>(),
      );
      verify(() => dataSourceService.signInWithEmailAndPassword(
            authenticationRequest: authenticationRequest,
          )).called(1);
    });

    test('should return Failure when sign in fails', () async {
      when(() => dataSourceService.signInWithEmailAndPassword(
            authenticationRequest: authenticationRequest,
          )).thenAnswer((_) async => const Left(WrongPasswordFailure()));

      final result = await repository(
        email: testEmail,
        password: testPassword,
      );

      expect(result.isLeft(), isTrue);
      expect(
        result.fold(
          (l) => l,
          (r) => r,
        ),
        isA<Failure>(),
      );
      expect(result, const Left(WrongPasswordFailure()));
      verify(() => dataSourceService.signInWithEmailAndPassword(
            authenticationRequest: authenticationRequest,
          )).called(1);
    });
  });
}
