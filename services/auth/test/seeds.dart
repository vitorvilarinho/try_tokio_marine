// ignore_for_file: lines_longer_than_80_chars

import 'package:auth/src/domain/models/sign_up_model.dart';
import 'package:user/user.dart';

class Seeds {
  static const uid = '12345';
  static const email = 'test@example.com';
  static const password = 'password123';
  static const firstName = 'John';
  static const lastName = 'Doe';
  static const cpf = '12345670088';
  static const refreshToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NSIsInR5cGUiOiJyZWZyZXNoIiwiaWF0IjoxNjAwMDAwMDAwLCJleHAiOjE2MDAwODAwMDB9.dQw4w9WgXcQK7Q2vQw4w9WgXcQK7Q2vQw4w9WgXcQK7';
  static const token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NSIsImVtYWlsIjoidGVzdEBleGFtcGxlLmNvbSIsIm5hbWUiOiJKb2huIE0gRG9lIiwiaWF0IjoxNjAwMDAwMDAwLCJleHAiOjE2MDAwODAwMDB9.sflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';
  static const signInProvider = 'email';
  static final authTime = DateTime(2025, 5, 22);
  static final expirationTime = authTime.add(const Duration(days: 1));
  static final issuedAtTime = authTime;
  static const profile = Profile(
    uid: uid,
    firstName: firstName,
    lastName: lastName,
    email: email,
    cpf: cpf,
  );
  static const signUpModelodel = SignUpModel(
    email: email,
    password: password,
    firstName: firstName,
    lastName: lastName,
    cpf: cpf,
  );
}
