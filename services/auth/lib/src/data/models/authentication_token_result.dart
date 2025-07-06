import 'package:equatable/equatable.dart';

/// Represents a result token for authentication.
/// This class contains the necessary information
/// returned after a successful authentication attempt.
/// It includes the authentication time, expiration time,
/// issued time, sign-in provider, token, and refresh token.
class AuthenticationTokenResult extends Equatable {
  /// Constructor for [AuthenticationTokenResult].
  /// Takes the [authTime], [expirationTime], [issuedAtTime],
  /// [signInProvider], [token], and [refreshToken] as parameters.
  const AuthenticationTokenResult({
    this.authTime,
    this.expirationTime,
    this.issuedAtTime,
    this.signInProvider,
    this.token,
    this.refreshToken,
  });

  /// The time when the authentication token was issued.
  final DateTime? authTime;

  /// The time when the authentication token will expire.
  final DateTime? expirationTime;

  /// The time when the authentication token was issued.
  final DateTime? issuedAtTime;

  /// The provider used for signing in.
  final String? signInProvider;

  /// The authentication token.
  final String? token;

  /// The refresh token used to obtain a new authentication token.
  final String? refreshToken;

  @override
  List<Object?> get props => [
        authTime,
        expirationTime,
        issuedAtTime,
        signInProvider,
        token,
        refreshToken,
      ];
}
