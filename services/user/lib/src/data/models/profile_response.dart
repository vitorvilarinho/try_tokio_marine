import 'package:equatable/equatable.dart';

class ProfileResponse extends Equatable {
  const ProfileResponse._({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.cpf,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse._(
      uid: json['uid'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      cpf: json['cpf'] as String,
    );
  }

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

  @override
  List<Object?> get props => [
        uid,
        firstName,
        lastName,
        email,
        cpf,
      ];
}
