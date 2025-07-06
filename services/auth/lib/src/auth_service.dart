import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:user/user.dart';

import 'auth_service_impl.dart';
import 'data/data_sources/firebase/firebase_remote_service.dart';
import 'data/repositories/fetch_logged_user_repository_impl.dart';
import 'data/repositories/remove_user_repository_impl.dart';
import 'data/repositories/sign_in_with_email_and_password_repository_impl.dart';
import 'data/repositories/sign_out_repository_impl.dart';
import 'data/repositories/sign_up_with_email_and_password_repository_impl.dart';
import 'data/repositories/verify_if_have_authenticated_user_repository_impl.dart';
import 'domain/models/models.dart';
import 'domain/use_cases/use_cases.dart';

/// This is a service that provides authentication functionalities.
/// It is a singleton class that provides methods to sign in, sign up,
/// sign out, and verify if a user is authenticated.
/// It uses the [AuthServiceImpl] class to implement the functionalities.
/// The [AuthService] class is an abstract class that defines the methods
/// that the [AuthServiceImpl] class must implement.
abstract class AuthService {
  /// Creates a singleton instance of [AuthServiceImpl] using the
  /// [AuthServiceImpl] class.
  /// It uses the [SignInWithEmailAndPasswordUsecase],
  /// [SignUpWithEmailAndPasswordUsecase], [SignOutUsecase],
  /// and [VerifyIfHaveAuthenticateUserUsecase] classes to implement
  /// the functionalities.
  static AuthService? _instance;

  /// Creates a singleton instance of [AuthServiceImpl] using the
  /// [AuthServiceImpl] class.
  /// It uses the [SignInWithEmailAndPasswordUsecase],
  /// [SignUpWithEmailAndPasswordUsecase], [SignOutUsecase],
  /// and [VerifyIfHaveAuthenticateUserUsecase] classes to implement
  /// the functionalities.
  static AuthService get instance => _instance ??= AuthServiceImpl(
      signInWithEmailAndPasswordUsecase: SignInWithEmailAndPasswordUsecase(
        repository: SignInWithEmailAndPasswordRepositoryImpl(
          dataSourceService: FirebaseRemoteService.instance,
        ),
      ),
      signUpWithEmailAndPasswordUsecase: SignUpWithEmailAndPasswordUsecase(
        removeUserRepository: RemoveUserRepositoryImpl(
          dataSourceService: FirebaseRemoteService.instance,
        ),
        signUpWithEmailAndPasswordRepository:
            SignUpWithEmailAndPasswordRepositoryImpl(
          dataSourceService: FirebaseRemoteService.instance,
        ),
        userService: UserService.instance,
      ),
      signOutUsecase: SignOutUsecase(
        signOutRepository: SignOutRepositoryImpl(
          dataSourceService: FirebaseRemoteService.instance,
        ),
      ),
      verifyIfHaveAuthenticateUserUsecase: VerifyIfHaveAuthenticateUserUsecase(
        verifyIfHaveAuthenticateUserRepository:
            VerifyIfHaveAuthenticatedUserRepositoryImpl(
          dataSourceService: FirebaseRemoteService.instance,
        ),
      ),
      fetchLoggedUserUsecase: FetchLoggedUserUsecase(
        fetchLoggedUserRepository: FetchLoggedUserRepositoryImpl(
          dataSourceService: FirebaseRemoteService.instance,
        ),
      ));

  /// Signs in a user with the given [email] and [password].
  /// Returns a [Future] that resolves to an [Either] containing
  /// a [Failure] or a [AuthenticationModel] value.
  /// If the sign in is successful, the [Either] will contain a [void] value.
  /// If the sign in fails, the [Either] will contain a [Failure] value.
  /// The [email] and [password] parameters are required.
  /// Throws an [ArgumentError] if the [email] or [password] is null.
  /// Example:
  /// ```dart
  /// final authService = AuthService.instance;
  /// final result = await authService.signInWithEmailAndPassword(
  ///   email: 'name@server.com'
  ///   password: 'password',
  /// );
  /// result.fold(
  ///   (failure) {
  ///     // Handle failure
  ///   },
  ///   (authenticationModel) {
  ///     // Handle success
  ///   },
  /// );
  /// ```
  Future<Either<Failure, AuthenticationModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Signs up a user with the given [email], [password], [firstName],
  /// [lastName], [middleName], and [urlProfileAvatar].
  /// Returns a [Future] that resolves to an [Either] containing
  /// a [Failure] or a [AuthenticationModel] value.
  /// If the sign up is successful, the [Either] will contain a [void] value.
  /// If the sign up fails, the [Either] will contain a [Failure] value.
  /// The [email], [password], [firstName], and [lastName] parameters are
  /// required. The [middleName] and [urlProfileAvatar] parameters are optional.
  /// Throws an [ArgumentError] if the [email], [password], [firstName],
  /// or [lastName] is null.
  /// Example:
  /// ```dart
  /// final authService = AuthService.instance;
  /// final result = await authService.signUpWithEmailAndPassword(
  ///   email: 'name@server.com',
  ///  password: 'password',
  ///  firstName: 'John',
  ///  lastName: 'Doe',
  ///  middleName: 'M',
  /// urlProfileAvatar: 'https://example.com/avatar.png',
  /// );
  /// result.fold(
  ///   (failure) {
  ///     // Handle failure
  ///   },
  ///   (authenticationModel) {
  ///     // Handle success
  ///   },
  /// );
  /// ```
  Future<Either<Failure, AuthenticationModel>> signUpWithEmailAndPassword({
    required SignUpModel signUpModel,
  });

  Future<Either<Failure, Profile>> fetchLoggedUser();

  /// Signs out the current user.
  /// Example:
  /// ```dart
  /// final authService = AuthService.instance;
  /// await authService.signOut();
  /// ```
  Future<void> signOut();

  /// Verifies if the user is authenticated.
  /// Returns a [Future] that resolves to a [bool] value.
  /// If the user is authenticated, the [Future] will resolve to true.
  /// If the user is not authenticated, the [Future] will resolve to false.
  /// Example:
  /// ```dart
  /// final authService = AuthService.instance;
  /// final isAuthenticated = await authService.isAuthenticated;
  /// if (isAuthenticated) {
  ///   // User is authenticated
  /// } else {
  ///   // User is not authenticated
  /// }
  /// ```
  Future<bool> get isAuthenticated;
}
