import 'package:auth/src/data/models/authentication_token_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthenticationTokenResult', () {
    final now = DateTime.now();
    final expiration = now.add(const Duration(hours: 1));
    final issuedAt = now.subtract(const Duration(minutes: 5));

    test('should support value equality', () {
      final a = AuthenticationTokenResult(
        authTime: now,
        expirationTime: expiration,
        issuedAtTime: issuedAt,
        signInProvider: 'google',
        token: 'token123',
        refreshToken: 'refresh123',
      );
      final b = AuthenticationTokenResult(
        authTime: now,
        expirationTime: expiration,
        issuedAtTime: issuedAt,
        signInProvider: 'google',
        token: 'token123',
        refreshToken: 'refresh123',
      );
      expect(a, equals(b));
    });

    test('should have correct props', () {
      final result = AuthenticationTokenResult(
        authTime: now,
        expirationTime: expiration,
        issuedAtTime: issuedAt,
        signInProvider: 'facebook',
        token: 'abc',
        refreshToken: 'def',
      );
      expect(result.props, [
        now,
        expiration,
        issuedAt,
        'facebook',
        'abc',
        'def',
      ]);
    });

    test('should allow null values', () {
      const result = AuthenticationTokenResult();
      expect(result.authTime, isNull);
      expect(result.expirationTime, isNull);
      expect(result.issuedAtTime, isNull);
      expect(result.signInProvider, isNull);
      expect(result.token, isNull);
      expect(result.refreshToken, isNull);
    });

    test('should not be equal if any property differs', () {
      const a = AuthenticationTokenResult(token: 'token1');
      const b = AuthenticationTokenResult(token: 'token2');
      expect(a, isNot(equals(b)));
    });
  });
}
