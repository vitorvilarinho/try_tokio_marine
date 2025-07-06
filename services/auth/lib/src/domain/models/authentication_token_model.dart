import 'package:equatable/equatable.dart';

/// A model that represents the authentication token information.
/// This class contains various properties related to the authentication token,
/// such as the time of authentication, expiration time, issued time,
/// sign-in provider, token, and refresh token.
/// It is used to encapsulate the authentication token details
/// and provides a way to compare instances of this model.
/// The [AuthenticationTokenModel] class extends the [Equatable] class
/// to provide value equality, allowing instances of this class
/// to be compared based on their properties rather than their reference.
class AuthenticationTokenModel extends Equatable {
  /// Creates an instance of [AuthenticationTokenModel].
  /// The [authTime] parameter is optional and represents the time
  /// of authentication.
  /// The [expirationTime] parameter is optional and represents the expiration
  /// time of the token.
  /// The [issuedAtTime] parameter is optional and represents the time
  /// the token was issued.
  /// The [signInProvider] parameter is optional and represents the sign-in
  /// provider used for authentication.
  /// The [token] parameter is optional and represents the authentication token.
  /// The [refreshToken] parameter is optional and represents the refresh token
  /// used to obtain a new authentication token.
  const AuthenticationTokenModel({
    this.authTime,
    this.expirationTime,
    this.issuedAtTime,
    this.signInProvider,
    this.token,
    this.refreshToken,
  });

  /// The time of authentication.
  final DateTime? authTime;

  /// The expiration time of the token.
  final DateTime? expirationTime;

  /// The time the token was issued.
  final DateTime? issuedAtTime;

  /// The sign-in provider used for authentication.
  /// This could be a provider like E-mai, Google, Facebook, etc.
  final String? signInProvider;

  /// The authentication token.
  /// This token is typically used to authenticate API requests.
  /// It is usually a JWT (JSON Web Token) or similar format.
  final String? token;

  /// The refresh token used to obtain a new authentication token.
  /// This token is typically used to refresh the authentication
  /// token when it expires.
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
