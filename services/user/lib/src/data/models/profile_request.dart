import 'package:equatable/equatable.dart';

class ProfileRequest extends Equatable {
  const ProfileRequest({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.createdAt,
    required this.cpf,
  });

  /// The unique identifier of the user.
  final String uid;

  /// The first name of the user.
  final String firstName;

  /// The last name of the user.
  final String lastName;

  /// The email address of the user.
  final String email;

  /// The CPF document number of the user.
  final String cpf;

  /// The date and time when the profile was created.
  final DateTime createdAt;

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'cpf': cpf,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        uid,
        firstName,
        lastName,
        cpf,
        createdAt,
      ];
}
