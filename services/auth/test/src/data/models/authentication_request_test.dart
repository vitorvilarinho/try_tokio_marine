import 'package:auth/src/data/models/authentication_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthenticationRequest', () {
    test('should create an instance with given email and password', () {
      const email = 'test@example.com';
      const password = 'securePassword123';
      const request = AuthenticationRequest(email: email, password: password);

      expect(request.email, email);
      expect(request.password, password);
    });

    test('should support value equality', () {
      const request1 = AuthenticationRequest(
        email: 'user@example.com',
        password: 'pass123',
      );
      const request2 = AuthenticationRequest(
        email: 'user@example.com',
        password: 'pass123',
      );
      expect(request1, equals(request2));
    });

    test('should have correct props for Equatable', () {
      const request = AuthenticationRequest(
        email: 'user@example.com',
        password: 'pass123',
      );
      expect(request.props, ['user@example.com', 'pass123']);
    });

    test('should not be equal if email is different', () {
      const request1 = AuthenticationRequest(
        email: 'user1@example.com',
        password: 'pass123',
      );
      const request2 = AuthenticationRequest(
        email: 'user2@example.com',
        password: 'pass123',
      );
      expect(request1, isNot(equals(request2)));
    });

    test('should not be equal if password is different', () {
      const request1 = AuthenticationRequest(
        email: 'user@example.com',
        password: 'pass123',
      );
      const request2 = AuthenticationRequest(
        email: 'user@example.com',
        password: 'pass456',
      );
      expect(request1, isNot(equals(request2)));
    });
  });
}
