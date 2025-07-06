import 'package:equatable/equatable.dart';

/// A model that represents the sign-up information of a user.
/// This class contains the user's email and profile information.
/// The [SignUpModel] class is immutable and should be instantiated with all
/// required fields.
/// The [email] is the user's email address.
/// The [password] is the user's password for authentication.
/// The [firstName] is the user's first name.
/// The [lastName] is the user's last name.
/// The [SignUpModel] class is used to represent the sign-up information
/// of a user.
class SignUpModel extends Equatable {
  /// Creates a [SignUpModel] instance.
  /// This class contains the user's email and profile information.
  const SignUpModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.cpf,
  });

  /// The email address of the user.
  final String email;

  /// The password of the user.
  /// This is used for authentication purposes.
  final String password;

  /// The first name of the user.
  final String firstName;

  /// The last name of the user.
  final String lastName;

  /// The CPF document number of the user.
  final String cpf;

  @override
  List<Object?> get props => [
        email,
        firstName,
        lastName,
        password,
        cpf,
      ];
}
