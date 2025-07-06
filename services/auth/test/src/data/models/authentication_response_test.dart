import 'package:auth/src/data/models/authentication_response.dart';
import 'package:auth/src/data/models/authentication_token_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthenticationResponse', () {
    const uid = 'user123';
    const email = 'user@example.com';
    const token = 'token_abc';
    final now = DateTime.now();

    final authToken = AuthenticationTokenResult(
      token: token,
      expirationTime: now,
      authTime: now,
      issuedAtTime: now,
      signInProvider: 'email',
    );

    test('should create an instance with correct values', () {
      final response = AuthenticationResponse(
        uid: uid,
        email: email,
        authToken: authToken,
      );

      expect(response.uid, uid);
      expect(response.email, email);
      expect(response.authToken, authToken);
    });

    test('should support value equality', () {
      final response1 = AuthenticationResponse(
        uid: uid,
        email: email,
        authToken: authToken,
      );
      final response2 = AuthenticationResponse(
        uid: uid,
        email: email,
        authToken: authToken,
      );

      expect(response1, equals(response2));
    });

    test('should have correct props for Equatable', () {
      final response = AuthenticationResponse(
        uid: uid,
        email: email,
        authToken: authToken,
      );

      expect(response.props, [uid, email, authToken]);
    });

    test('should not be equal if any field is different', () {
      final response1 = AuthenticationResponse(
        uid: uid,
        email: email,
        authToken: authToken,
      );
      final response2 = AuthenticationResponse(
        uid: 'other',
        email: email,
        authToken: authToken,
      );
      final response3 = AuthenticationResponse(
        uid: uid,
        email: 'other@example.com',
        authToken: authToken,
      );
      final response4 = AuthenticationResponse(
        uid: uid,
        email: email,
        authToken: AuthenticationTokenResult(
          token: 'other',
          expirationTime: now,
        ),
      );

      expect(response1 == response2, isFalse);
      expect(response1 == response3, isFalse);
      expect(response1 == response4, isFalse);
    });
  });
}
