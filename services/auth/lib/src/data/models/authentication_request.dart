import 'package:equatable/equatable.dart';

/// Represents a request for authentication.
/// This class contains the necessary information for
/// authenticating a user, including their email and password.
/// It is used in the authentication process to verify the user's
/// credentials.
/// The [AuthenticationRequest] class is part of the authentication
/// service and is used to encapsulate the data required for
/// authentication.
class AuthenticationRequest extends Equatable {
  /// Constructor for [AuthenticationRequest].
  /// Takes the [email] and [password] as parameters.
  /// The [email] is the user's email address used for authentication.
  /// The [password] is the user's password used for authentication.
  const AuthenticationRequest({
    required this.email,
    required this.password,
  });

  /// The user's email address used for authentication.
  final String email;

  /// The user's password used for authentication.
  final String password;

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
