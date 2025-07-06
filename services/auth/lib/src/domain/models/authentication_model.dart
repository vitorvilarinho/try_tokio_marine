import 'package:equatable/equatable.dart';

import 'authentication_token_model.dart';

/// A model that represents the authentication information of a user.
/// This class contains the user's unique identifier (UID), email address,
/// and an authentication token model.
/// It is used to encapsulate the authentication details of a user
/// and provides a way to compare instances of this model.
/// The [AuthenticationModel] class extends the [Equatable] class
/// to provide value equality, allowing instances of this class
/// to be compared based on their properties rather than their reference.
class AuthenticationModel extends Equatable {
  /// Creates an instance of [AuthenticationModel].
  /// The [uid] parameter is required and represents the unique identifier
  /// of the user.
  /// The [email] parameter is required and represents the email address
  /// of the user.
  /// The [authenticationTokenModel] parameter is required and represents
  /// the authentication token model associated with the user.
  const AuthenticationModel({
    required this.uid,
    required this.email,
    required this.authenticationTokenModel,
  });

  /// The unique identifier of the user.
  final String uid;

  /// The email address of the user.
  final String email;

  /// The authentication token model associated with the user.
  final AuthenticationTokenModel authenticationTokenModel;

  @override
  List<Object?> get props => [
        uid,
        email,
        authenticationTokenModel,
      ];
}
