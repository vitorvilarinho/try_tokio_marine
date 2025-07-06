import 'package:auth/src/domain/models/authentication_token_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthenticationTokenModel', () {
    test('should support value equality', () {
      final now = DateTime.now();
      final model1 = AuthenticationTokenModel(
        authTime: now,
        expirationTime: now.add(const Duration(hours: 1)),
        issuedAtTime: now.subtract(const Duration(hours: 1)),
        signInProvider: 'google',
        token: 'token123',
        refreshToken: 'refresh123',
      );
      final model2 = AuthenticationTokenModel(
        authTime: now,
        expirationTime: now.add(const Duration(hours: 1)),
        issuedAtTime: now.subtract(const Duration(hours: 1)),
        signInProvider: 'google',
        token: 'token123',
        refreshToken: 'refresh123',
      );
      expect(model1, equals(model2));
    });

    test('should not be equal if any property is different', () {
      final now = DateTime.now();
      final model1 = AuthenticationTokenModel(
        authTime: now,
        expirationTime: now.add(const Duration(hours: 1)),
        issuedAtTime: now.subtract(const Duration(hours: 1)),
        signInProvider: 'google',
        token: 'token123',
        refreshToken: 'refresh123',
      );
      final model2 = AuthenticationTokenModel(
        authTime: now,
        expirationTime: now.add(const Duration(hours: 2)), // different
        issuedAtTime: now.subtract(const Duration(hours: 1)),
        signInProvider: 'google',
        token: 'token123',
        refreshToken: 'refresh123',
      );
      expect(model1, isNot(equals(model2)));
    });

    test('should allow null values for all properties', () {
      const model = AuthenticationTokenModel();
      expect(model.authTime, isNull);
      expect(model.expirationTime, isNull);
      expect(model.issuedAtTime, isNull);
      expect(model.signInProvider, isNull);
      expect(model.token, isNull);
      expect(model.refreshToken, isNull);
    });

    test('props should contain all properties in order', () {
      final now = DateTime.now();
      final model = AuthenticationTokenModel(
        authTime: now,
        expirationTime: now.add(const Duration(hours: 1)),
        issuedAtTime: now.subtract(const Duration(hours: 1)),
        signInProvider: 'email',
        token: 'abc',
        refreshToken: 'def',
      );
      expect(
        model.props,
        [
          now,
          now.add(const Duration(hours: 1)),
          now.subtract(const Duration(hours: 1)),
          'email',
          'abc',
          'def',
        ],
      );
    });
  });
}
