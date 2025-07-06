import 'package:auth/src/data/data_sources/firebase/firebase_remote_service.dart';
import 'package:auth/src/data/models/data_models.dart';
import 'package:auth/src/domain/failures/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user/user.dart';

import '../../../mocks.dart';

void main() {
  late FirebaseAuth mockFirebaseAuth;
  late UserService userService;
  late FirebaseRemoteService service;
  late UserCredential userCredential;
  late User user;
  late IdTokenResult idTokenResult;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    userService = MockUserService();
    userCredential = MockUserCredential();
    user = MockUser();
    idTokenResult = MockIdTokenResult();

    service = FirebaseRemoteService(
      firebaseAuth: mockFirebaseAuth,
      userService: userService,
    );
  });

  group('signInWithEmailAndPassword', () {
    const request = AuthenticationRequest(
      email: 'test@test.com',
      password: '123456',
    );

    test('returns AuthenticationResponse on success', () async {
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => userCredential);

      when(() => userCredential.user).thenReturn(user);
      when(() => user.email).thenReturn('test@test.com');
      when(() => user.uid).thenReturn('uid');
      when(() => user.getIdTokenResult())
          .thenAnswer((_) async => idTokenResult);
      when(() => user.getIdToken()).thenAnswer((_) async => 'token');
      when(() => idTokenResult.authTime).thenReturn(DateTime.now());
      when(() => idTokenResult.expirationTime)
          .thenReturn(DateTime.now().add(const Duration(hours: 1)));
      when(() => idTokenResult.issuedAtTime).thenReturn(DateTime.now());
      when(() => user.refreshToken).thenReturn('refreshToken');
      when(() => idTokenResult.signInProvider).thenReturn('password');

      final result = await service.signInWithEmailAndPassword(
          authenticationRequest: request);

      expect(result.isRight(), true);
      expect(result.getOrElse(() => throw Exception()).email, 'test@test.com');
    });

    test('returns AuthGenericFailure if user is null', () async {
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => userCredential);
      when(() => userCredential.user).thenReturn(null);

      final result = await service.signInWithEmailAndPassword(
          authenticationRequest: request);

      expect(result.isLeft(), true);
      expect(result.swap().getOrElse(() => throw Exception()),
          isA<AuthGenericFailure>());
    });

    test('returns InvalidEmailFailure on invalid-email', () async {
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(FirebaseAuthException(code: 'invalid-email'));

      final result = await service.signInWithEmailAndPassword(
          authenticationRequest: request);

      expect(result.isLeft(), true);
      expect(result.swap().getOrElse(() => throw Exception()),
          isA<InvalidEmailFailure>());
    });

    test('returns WrongPasswordFailure on wrong-password', () async {
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(FirebaseAuthException(code: 'wrong-password'));

      final result = await service.signInWithEmailAndPassword(
          authenticationRequest: request);

      expect(result.isLeft(), true);
      expect(result.swap().getOrElse(() => throw Exception()),
          isA<WrongPasswordFailure>());
    });

    test('returns AuthGenericFailure on generic exception', () async {
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(Exception('error'));

      final result = await service.signInWithEmailAndPassword(
          authenticationRequest: request);

      expect(result.isLeft(), true);
      expect(result.swap().getOrElse(() => throw Exception()),
          isA<AuthGenericFailure>());
    });
  });

  group('signUpWithEmailAndPassword', () {
    const signUpRequest = SignUpRequest(
      firstName: 'John',
      lastName: 'Doe',
      cpf: '12345600886',
      authentication: AuthenticationRequest(
        email: '',
        password: '',
      ),
    );

    test('returns AuthenticationResponse on success', () async {
      when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => userCredential);
      when(() => userCredential.user).thenReturn(user);
      when(() => mockFirebaseAuth.currentUser).thenReturn(user);
      when(() => user.updateProfile(displayName: any(named: 'displayName')))
          .thenAnswer((_) async {
        return;
      });
      when(() => user.email).thenReturn('test@test.com');
      when(() => user.uid).thenReturn('uid');
      when(() => user.getIdTokenResult())
          .thenAnswer((_) async => idTokenResult);
      when(() => user.getIdToken()).thenAnswer((_) async => 'token');
      when(() => idTokenResult.authTime).thenReturn(DateTime.now());
      when(() => idTokenResult.expirationTime)
          .thenReturn(DateTime.now().add(const Duration(hours: 1)));
      when(() => idTokenResult.issuedAtTime).thenReturn(DateTime.now());
      when(() => user.refreshToken).thenReturn('refreshToken');
      when(() => idTokenResult.signInProvider).thenReturn('password');

      final result = await service.signUpWithEmailAndPassword(
          signUpRequest: signUpRequest);

      expect(result.isRight(), true);
      expect(result.getOrElse(() => throw Exception()).email, 'test@test.com');
    });

    test('returns AuthGenericFailure if user is null', () async {
      when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => userCredential);
      when(() => userCredential.user).thenReturn(null);

      final result = await service.signUpWithEmailAndPassword(
          signUpRequest: signUpRequest);

      expect(result.isLeft(), true);
      expect(result.swap().getOrElse(() => throw Exception()),
          isA<AuthGenericFailure>());
    });

    test('returns EmailAlreadyInUseFailure on email-already-in-use', () async {
      when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(FirebaseAuthException(code: 'email-already-in-use'));

      final result = await service.signUpWithEmailAndPassword(
          signUpRequest: signUpRequest);

      expect(result.isLeft(), true);
      expect(result.swap().getOrElse(() => throw Exception()),
          isA<EmailAlreadyInUseFailure>());
    });

    test('returns WeakPasswordFailure on weak-password', () async {
      when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(FirebaseAuthException(code: 'weak-password'));

      final result = await service.signUpWithEmailAndPassword(
          signUpRequest: signUpRequest);

      expect(result.isLeft(), true);
      expect(result.swap().getOrElse(() => throw Exception()),
          isA<WeakPasswordFailure>());
    });

    test('returns AuthGenericFailure on generic exception', () async {
      when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(Exception('error'));

      final result = await service.signUpWithEmailAndPassword(
          signUpRequest: signUpRequest);

      expect(result.isLeft(), true);
      expect(result.swap().getOrElse(() => throw Exception()),
          isA<AuthGenericFailure>());
    });
  });

  group('hasUser', () {
    test('returns true if user exists', () async {
      when(() => mockFirebaseAuth.currentUser).thenReturn(user);
      final result = await service.hasUser();
      expect(result, true);
    });

    test('returns false if user does not exist', () async {
      when(() => mockFirebaseAuth.currentUser).thenReturn(null);
      final result = await service.hasUser();
      expect(result, false);
    });
  });

  group('signOut', () {
    test('calls signOut on FirebaseAuth', () async {
      when(() => mockFirebaseAuth.signOut()).thenAnswer((_) async {});
      await service.signOut();
      verify(() => mockFirebaseAuth.signOut()).called(1);
    });
  });
}
