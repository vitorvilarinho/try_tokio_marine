import 'package:equatable/equatable.dart';

import 'data_models.dart';

/// Represents a request for signing up a user.
/// This class contains the necessary information for
/// signing up a user, including their first name, last name,
/// middle name, profile avatar URL, and authentication details.
/// It is used in the sign-up process to create a new user account.
class SignUpRequest extends Equatable {
  /// Constructor for [SignUpRequest].
  /// Takes the [firstName], [lastName], [cpf],
  /// and [authentication] as parameters.
  const SignUpRequest({
    required this.firstName,
    required this.lastName,
    required this.cpf,
    required this.authentication,
  });

  /// The first name of the user.
  final String firstName;

  /// The last name of the user.
  final String lastName;

  /// The CPF document number of the user.
  final String cpf;

  /// The authentication details of the user.
  final AuthenticationRequest authentication;

  /// The full name of the user, constructed from the first name,
  /// middle name (if provided), and last name.
  /// If the middle name is not provided, it returns the first name
  /// and last name only.
  String get fullName => '$firstName $lastName';

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        authentication,
        cpf,
      ];
}
