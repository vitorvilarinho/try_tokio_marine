import 'package:auth/src/domain/failures/failures.dart';
import 'package:auth/src/domain/models/models.dart';
import 'package:auth/src/domain/repositories/sign_in_with_email_and_password_repository.dart';
import 'package:auth/src/domain/use_cases/sign_in_with_email_and_password_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late SignInWithEmailAndPasswordUsecase usecase;
  late SignInWithEmailAndPasswordRepository mockRepository;

  setUp(() {
    mockRepository = MockSignInWithEmailAndPasswordRepository();
    usecase = SignInWithEmailAndPasswordUsecase(repository: mockRepository);
  });

  const tEmail = 'test@example.com';
  const tPassword = 'password123';
  final now = DateTime.now();
  final tAuthModel = AuthenticationModel(
    uid: '12345',
    email: tEmail,
    authenticationTokenModel: AuthenticationTokenModel(
      authTime: now,
      expirationTime: now,
      issuedAtTime: now,
      refreshToken: 'refreshToken',
      signInProvider: 'email',
      token: 'authToken',
    ),
  );

  test('should return AuthenticationModel when sign in is successful',
      () async {
    when(() => mockRepository(
          email: tEmail,
          password: tPassword,
        )).thenAnswer((_) async => Right(tAuthModel));

    final result = await usecase(email: tEmail, password: tPassword);

    expect(result, Right(tAuthModel));
    verify(() => mockRepository(email: tEmail, password: tPassword)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return Failure when sign in fails', () async {
    when(() => mockRepository(
          email: tEmail,
          password: tPassword,
        )).thenAnswer((_) async => const Left(WrongPasswordFailure()));

    final result = await usecase(email: tEmail, password: tPassword);

    expect(result.isLeft(), isTrue);
    expect(result.fold((l) => l, (r) => r), isA<WrongPasswordFailure>());
    verify(() => mockRepository(email: tEmail, password: tPassword)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should call repository with correct parameters', () async {
    when(() => mockRepository(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenAnswer((_) async => Right(tAuthModel));

    await usecase(email: tEmail, password: tPassword);

    verify(() => mockRepository(email: tEmail, password: tPassword)).called(1);
  });
}
