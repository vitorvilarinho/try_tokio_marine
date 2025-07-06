import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:user/user.dart';

import 'auth_service.dart';
import 'domain/models/models.dart';
import 'domain/use_cases/use_cases.dart';

/// This is a implementation of the [AuthService] class.
/// It provides methods to sign in, sign up, sign out,
/// and verify if a user is authenticated.
class AuthServiceImpl implements AuthService {
  /// Creates an instance of [AuthServiceImpl].
  AuthServiceImpl({
    required SignInWithEmailAndPasswordUsecase
        signInWithEmailAndPasswordUsecase,
    required SignUpWithEmailAndPasswordUsecase
        signUpWithEmailAndPasswordUsecase,
    required SignOutUsecase signOutUsecase,
    required VerifyIfHaveAuthenticateUserUsecase
        verifyIfHaveAuthenticateUserUsecase,
    required FetchLoggedUserUsecase fetchLoggedUserUsecase,
  })  : _signInWithEmailAndPasswordUsecase = signInWithEmailAndPasswordUsecase,
        _signUpWithEmailAndPasswordUsecase = signUpWithEmailAndPasswordUsecase,
        _signOutUsecase = signOutUsecase,
        _verifyIfHaveAuthenticateUserUsecase =
            verifyIfHaveAuthenticateUserUsecase,
        _fetchLoggedUserUsecase = fetchLoggedUserUsecase;

  final SignInWithEmailAndPasswordUsecase _signInWithEmailAndPasswordUsecase;
  final SignUpWithEmailAndPasswordUsecase _signUpWithEmailAndPasswordUsecase;
  final SignOutUsecase _signOutUsecase;
  final VerifyIfHaveAuthenticateUserUsecase
      _verifyIfHaveAuthenticateUserUsecase;
  final FetchLoggedUserUsecase _fetchLoggedUserUsecase;

  @override
  Future<Either<Failure, AuthenticationModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      _signInWithEmailAndPasswordUsecase(
        email: email,
        password: password,
      );

  @override
  Future<Either<Failure, AuthenticationModel>> signUpWithEmailAndPassword({
    required SignUpModel signUpModel,
  }) =>
      _signUpWithEmailAndPasswordUsecase(
        signUpModel: signUpModel,
      );

  @override
  Future<bool> get isAuthenticated => _verifyIfHaveAuthenticateUserUsecase();

  @override
  Future<void> signOut() => _signOutUsecase();

  @override
  Future<Either<Failure, Profile>> fetchLoggedUser() =>
      _fetchLoggedUserUsecase();
}
