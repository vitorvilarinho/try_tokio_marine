import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user/user.dart';

import '../../../domain/failures/failures.dart';
import '../../models/data_models.dart';
import '../data_source_service.dart';

class FirebaseRemoteService implements DataSourceService {
  @visibleForTesting
  FirebaseRemoteService({
    required UserService userService,
    FirebaseAuth? firebaseAuth,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _userService = userService;

  static DataSourceService? _instance;
  static DataSourceService get instance =>
      _instance ??
      FirebaseRemoteService(
        userService: UserService.instance,
      );
  final FirebaseAuth _firebaseAuth;
  final UserService _userService;

  @override
  Future<Either<Failure, AuthenticationResponse>> signInWithEmailAndPassword({
    required AuthenticationRequest authenticationRequest,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: authenticationRequest.email,
        password: authenticationRequest.password,
      );
      if (userCredential.user == null) {
        return const Left(AuthGenericFailure());
      }

      final result = await _setAuthenticationResponse(
        userCredential: userCredential,
      );

      return Right(result);
    } on FirebaseAuthException catch (ex, stack) {
      return Left(_handleFirebaseAuthException(
        ex: ex,
        stack: stack,
      ));
    } on Exception catch (ex, stack) {
      return Left(AuthGenericFailure(
        exception: ex,
        stack: stack,
      ));
    }
  }

  @override
  Future<Either<Failure, AuthenticationResponse>> signUpWithEmailAndPassword({
    required SignUpRequest signUpRequest,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: signUpRequest.authentication.email,
        password: signUpRequest.authentication.password,
      );
      if (userCredential.user == null) {
        return const Left(AuthGenericFailure());
      }

      await _firebaseAuth.currentUser!.updateProfile(
        displayName: signUpRequest.fullName,
      );

      final result = await _setAuthenticationResponse(
        userCredential: userCredential,
      );

      return Right(result);
    } on FirebaseAuthException catch (ex, stack) {
      return Left(_handleFirebaseAuthException(
        ex: ex,
        stack: stack,
      ));
    } on Exception catch (ex, stack) {
      return Left(AuthGenericFailure(
        exception: ex,
        stack: stack,
      ));
    }
  }

  @override
  Future<bool> hasUser() => Future.value(_firebaseAuth.currentUser != null);

  @override
  Future<void> signOut() => _firebaseAuth.signOut();

  Failure _handleFirebaseAuthException({
    required FirebaseAuthException ex,
    Object? stack,
  }) =>
      switch (ex.code) {
        'invalid-email' => InvalidEmailFailure(
            exception: ex,
            stack: stack,
          ),
        'wrong-password' => WrongPasswordFailure(
            exception: ex,
            stack: stack,
          ),
        'user-not-found' || 'invalid-credential' => WrongPasswordFailure(
            exception: ex,
            stack: stack,
          ),
        'weak-password' => WeakPasswordFailure(
            exception: ex,
            stack: stack,
          ),
        'email-already-in-use' => EmailAlreadyInUseFailure(
            exception: ex,
            stack: stack,
          ),
        _ => AuthGenericFailure(
            exception: ex,
            stack: stack,
          ),
      };

  Future<AuthenticationResponse> _setAuthenticationResponse({
    required UserCredential userCredential,
  }) async {
    final tokenResult = await userCredential.user!.getIdTokenResult();
    final token = await userCredential.user!.getIdToken();
    final result = AuthenticationResponse(
      email: userCredential.user!.email!,
      uid: userCredential.user!.uid,
      authToken: AuthenticationTokenResult(
        authTime: tokenResult.authTime,
        expirationTime: tokenResult.expirationTime,
        issuedAtTime: tokenResult.issuedAtTime,
        refreshToken: userCredential.user!.refreshToken ?? '',
        signInProvider: tokenResult.signInProvider,
        token: token,
      ),
    );

    return result;
  }

  @override
  Future<void> removeUser() async {
    _firebaseAuth.currentUser?.delete();
  }

  @override
  Future<Either<Failure, Profile>> fetchLoggedUser() async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser == null) {
      return Left(LoggedUserNotFoundedFailure());
    }

    final uid = currentUser.uid;

    final profile = await _userService.fetchProfile(uid: uid);
    return profile;
  }
}
