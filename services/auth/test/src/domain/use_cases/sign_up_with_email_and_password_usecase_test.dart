import 'package:auth/src/domain/failures/failures.dart';
import 'package:auth/src/domain/models/models.dart';
import 'package:auth/src/domain/repositories/sign_up_with_email_and_password_repository.dart';
import 'package:auth/src/domain/use_cases/sign_up_with_email_and_password_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user/user.dart';

import '../../../mocks.dart';
import '../../../seeds.dart';

void main() {
  late SignUpWithEmailAndPasswordUsecase usecase;
  late SignUpWithEmailAndPasswordRepository mockRepository;
  late UserService userService;

  setUpAll(() {
    registerFallbackValue(Seeds.profile);
  });
  setUp(() {
    mockRepository = MockSignUpWithEmailAndPasswordRepository();
    userService = MockUserService();
    usecase = SignUpWithEmailAndPasswordUsecase(
      removeUserRepository: MockRemoveUserRepository(),
      userService: userService,
      signUpWithEmailAndPasswordRepository: mockRepository,
    );
  });

  const tEmail = 'test@example.com';
  const tPassword = 'password123';

  const tSignUpModel = SignUpModel(
    email: tEmail,
    password: tPassword,
    firstName: 'firstName',
    lastName: 'lastName',
    middleName: 'M',
    urlProfileAvatar: 'urlProfileAvatar',
  );

  final tAuthenticationModel = AuthenticationModel(
    uid: '12345',
    email: tEmail,
    authenticationTokenModel: AuthenticationTokenModel(
      authTime: DateTime.now(),
      expirationTime: DateTime.now(),
      issuedAtTime: DateTime.now(),
      refreshToken: 'refreshToken',
      signInProvider: 'email',
      token: 'authToken',
    ),
  );

  test('should call repository and return AuthenticationModel on success',
      () async {
    // arrange
    when(() => mockRepository(signUpModel: tSignUpModel))
        .thenAnswer((_) async => Right(tAuthenticationModel));
    when(() => userService.saveProfile(profile: any(named: 'profile')))
        .thenAnswer((_) async => const Right(Seeds.profile));
    // act
    final result = await usecase(signUpModel: tSignUpModel);
    // assert
    expect(result, Right(tAuthenticationModel));
    verify(() => mockRepository(signUpModel: tSignUpModel)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return Failure when repository returns Failure', () async {
    // arrange

    when(() => mockRepository(signUpModel: tSignUpModel))
        .thenAnswer((_) async => const Left(WeakPasswordFailure()));
    // act
    final result = await usecase(signUpModel: tSignUpModel);
    // assert
    expect(result.isLeft(), isTrue);
    expect(result.fold((l) => l, (r) => r), isA<WeakPasswordFailure>());
    verify(() => mockRepository(signUpModel: tSignUpModel)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
