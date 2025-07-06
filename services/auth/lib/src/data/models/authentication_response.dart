import 'package:equatable/equatable.dart';

import 'authentication_token_result.dart';

/// Represents a response from the authentication service.
/// This class contains the necessary information returned after
/// a successful authentication attempt.
/// It includes the user's unique identifier (UID), email address,
/// and an authentication token.
class AuthenticationResponse extends Equatable {
  /// Constructor for [AuthenticationResponse].
  /// Takes the [uid], [email], and [authToken] as parameters.
  /// The [uid] is the user's unique identifier used for authentication.
  /// The [email] is the user's email address used for authentication.
  /// The [authToken] is the authentication token returned after
  /// a successful authentication attempt.
  const AuthenticationResponse({
    required this.uid,
    required this.email,
    required this.authToken,
  });

  /// The user's unique identifier used for authentication.
  final String uid;

  /// The user's email address used for authentication.
  final String email;

  /// The authentication token returned after a successful
  /// authentication attempt.
  final AuthenticationTokenResult authToken;

  @override
  List<Object?> get props => [
        uid,
        email,
        authToken,
      ];
}
