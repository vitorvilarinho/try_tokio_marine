import 'package:equatable/equatable.dart';

/// A model representing a user's profile.
class Profile extends Equatable {
  /// Creates a [Profile] instance.
  const Profile({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
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

  /// The CPF document number of user.
  final String cpf;

  /// Full name of the user.
  String get fullName => '$firstName $lastName';

  /// Short name of the user.
  String get acronym => '${firstName[0]}${lastName[0]}';

  @override
  List<Object?> get props => [
        uid,
        firstName,
        lastName,
        email,
        cpf,
      ];
}
