import 'package:auth/src/auth_service.dart';
import 'package:auth/src/auth_service_impl.dart';
import 'package:auth/src/data/data_sources/firebase/firebase_remote_service.dart';
import 'package:auth/src/data/repositories/fetch_logged_user_repository_impl.dart';
import 'package:auth/src/data/repositories/remove_user_repository_impl.dart';
import 'package:auth/src/data/repositories/sign_in_with_email_and_password_repository_impl.dart';
import 'package:auth/src/data/repositories/sign_out_repository_impl.dart';
import 'package:auth/src/data/repositories/sign_up_with_email_and_password_repository_impl.dart';
import 'package:auth/src/data/repositories/verify_if_have_authenticated_user_repository_impl.dart';
import 'package:auth/src/domain/failures/failures.dart';
import 'package:auth/src/domain/models/authentication_model.dart';
import 'package:auth/src/domain/models/authentication_token_model.dart';
import 'package:auth/src/domain/use_cases/use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user/user.dart';

import '../mocks.dart';
import '../seeds.dart';

void main() {
  late UserService userService;
  late FirebaseAuth firebaseAuth;
  late FirebaseRemoteService firebaseRemoteService;
  late AuthService authService;
  late UserCredential userCredential;
  late User user;
  late IdTokenResult idTokenResult;

  setUpAll(() {
    registerFallbackValue(Seeds.profile);
  });

  setUp(() {
    userCredential = MockUserCredential();
    userService = MockUserService();
    firebaseAuth = MockFirebaseAuth();
    firebaseRemoteService = FirebaseRemoteService(
      firebaseAuth: firebaseAuth,
      userService: userService,
    );
    user = MockUser();
    idTokenResult = MockIdTokenResult();

    when(() => userCredential.user).thenReturn(user);
    when(() => user.uid).thenReturn(Seeds.uid);
    when(() => user.email).thenReturn(Seeds.email);
    when(() => user.refreshToken).thenReturn(Seeds.refreshToken);
    when(user.getIdToken).thenAnswer((_) async => Seeds.token);
    when(user.getIdTokenResult).thenAnswer((_) async => idTokenResult);

    when(() => idTokenResult.authTime).thenReturn(Seeds.authTime);
    when(() => idTokenResult.expirationTime).thenReturn(Seeds.expirationTime);
    when(() => idTokenResult.issuedAtTime).thenReturn(Seeds.issuedAtTime);
    when(() => idTokenResult.signInProvider).thenReturn(Seeds.signInProvider);
    when(() => userService.saveProfile(profile: any(named: 'profile')))
        .thenAnswer((_) async => const Right(Profile(
              uid: Seeds.uid,
              firstName: Seeds.firstName,
              lastName: Seeds.lastName,
              email: Seeds.email,
              cpf: Seeds.cpf,
            )));
    authService = AuthServiceImpl(
      signInWithEmailAndPasswordUsecase: SignInWithEmailAndPasswordUsecase(
        repository: SignInWithEmailAndPasswordRepositoryImpl(
          dataSourceService: firebaseRemoteService,
        ),
      ),
      signUpWithEmailAndPasswordUsecase: SignUpWithEmailAndPasswordUsecase(
        removeUserRepository:
            RemoveUserRepositoryImpl(dataSourceService: firebaseRemoteService),
        userService: userService,
        signUpWithEmailAndPasswordRepository:
            SignUpWithEmailAndPasswordRepositoryImpl(
          dataSourceService: firebaseRemoteService,
        ),
      ),
      signOutUsecase: SignOutUsecase(
        signOutRepository: SignOutRepositoryImpl(
          dataSourceService: firebaseRemoteService,
        ),
      ),
      verifyIfHaveAuthenticateUserUsecase: VerifyIfHaveAuthenticateUserUsecase(
        verifyIfHaveAuthenticateUserRepository:
            VerifyIfHaveAuthenticatedUserRepositoryImpl(
          dataSourceService: firebaseRemoteService,
        ),
      ),
      fetchLoggedUserUsecase: FetchLoggedUserUsecase(
        fetchLoggedUserRepository: FetchLoggedUserRepositoryImpl(
          dataSourceService: firebaseRemoteService,
        ),
      ),
    );
  });

  group('AuthService', () {
    final authenticationModel = AuthenticationModel(
      email: Seeds.email,
      uid: Seeds.uid,
      authenticationTokenModel: AuthenticationTokenModel(
        authTime: Seeds.authTime,
        expirationTime: Seeds.expirationTime,
        issuedAtTime: Seeds.issuedAtTime,
        refreshToken: Seeds.refreshToken,
        signInProvider: Seeds.signInProvider,
        token: Seeds.token,
      ),
    );

    test('signInWithEmailAndPassword returns AuthenticationModel on success',
        () async {
      when(() => firebaseAuth.signInWithEmailAndPassword(
            email: Seeds.email,
            password: Seeds.password,
          )).thenAnswer((_) async => userCredential);

      final result = await authService.signInWithEmailAndPassword(
        email: Seeds.email,
        password: Seeds.password,
      );

      expect(result.isRight(), true);
      result.fold(
        (_) => fail('Should not be failure'),
        (model) => expect(model, authenticationModel),
      );
    });

    test('signInWithEmailAndPassword returns Failure on error', () async {
      when(() => firebaseAuth.signInWithEmailAndPassword(
            email: Seeds.email,
            password: Seeds.password,
          )).thenThrow(FirebaseAuthException(code: 'wrong-password'));

      final result = await authService.signInWithEmailAndPassword(
        email: Seeds.email,
        password: Seeds.password,
      );

      expect(result.isLeft(), true);
      result.fold(
        (f) => expect(f, isA<WrongPasswordFailure>()),
        (_) => fail('Should not be success'),
      );
    });

    test('signUpWithEmailAndPassword returns AuthenticationModel on success',
        () async {
      when(() => firebaseAuth.createUserWithEmailAndPassword(
            email: Seeds.email,
            password: Seeds.password,
          )).thenAnswer((_) async => userCredential);
      when(() => firebaseAuth.currentUser).thenReturn(user);
      when(() => user.updateProfile(
            displayName: any(named: 'displayName'),
            photoURL: any(named: 'photoURL'),
          )).thenAnswer((_) async => Future.value());

      final result = await authService.signUpWithEmailAndPassword(
        signUpModel: Seeds.signUpModelodel,
      );

      expect(result.isRight(), true);
      result.fold(
        (_) => fail('Should not be failure'),
        (model) => expect(model, authenticationModel),
      );
    });

    test('signUpWithEmailAndPassword returns Failure on error', () async {
      when(() => firebaseAuth.createUserWithEmailAndPassword(
            email: Seeds.email,
            password: Seeds.password,
          )).thenThrow(FirebaseAuthException(code: 'email-already-in-use'));

      final result = await authService.signUpWithEmailAndPassword(
        signUpModel: Seeds.signUpModelodel,
      );

      expect(result.isLeft(), true);
      result.fold(
        (f) => expect(f, isA<EmailAlreadyInUseFailure>()),
        (_) => fail('Should not be success'),
      );
    });

    test('signOut completes without error', () async {
      when(firebaseAuth.signOut).thenAnswer((_) async => Future.value());

      expect(authService.signOut(), completes);
    });

    test('isAuthenticated returns true when user is authenticated', () async {
      when(() => firebaseAuth.currentUser).thenReturn(MockUser());

      final result = await authService.isAuthenticated;
      expect(result, true);
    });

    test('isAuthenticated returns false when user is not authenticated',
        () async {
      when(() => firebaseAuth.currentUser).thenReturn(null);

      final result = await authService.isAuthenticated;
      expect(result, false);
    });
  });
}
