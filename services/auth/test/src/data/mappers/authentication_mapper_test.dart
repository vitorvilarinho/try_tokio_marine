import 'package:auth/src/data/mappers/authentication_mapper.dart';
import 'package:auth/src/data/models/authentication_response.dart';
import 'package:auth/src/data/models/authentication_token_result.dart';
import 'package:auth/src/domain/models/authentication_model.dart';
import 'package:auth/src/domain/models/authentication_token_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthenticationMapper', () {
    const mapper = AuthenticationMapper();

    test('should map AuthenticationResponse to AuthenticationModel correctly',
        () {
      final now = DateTime.now();

      final response = AuthenticationResponse(
        uid: 'user123',
        email: 'test@example.com',
        authToken: AuthenticationTokenResult(
          authTime: now,
          expirationTime: now,
          issuedAtTime: now,
          signInProvider: 'password',
          token: 'token_abc',
          refreshToken: 'refresh_xyz',
        ),
      );

      final model = mapper.cast(response);

      expect(model, isA<AuthenticationModel>());
      expect(model.uid, equals('user123'));
      expect(model.email, equals('test@example.com'));
      expect(model.authenticationTokenModel, isA<AuthenticationTokenModel>());
      expect(model.authenticationTokenModel.authTime, equals(now));
      expect(model.authenticationTokenModel.expirationTime, equals(now));
      expect(model.authenticationTokenModel.issuedAtTime, equals(now));
      expect(model.authenticationTokenModel.signInProvider, equals('password'));
      expect(model.authenticationTokenModel.token, equals('token_abc'));
      expect(
          model.authenticationTokenModel.refreshToken, equals('refresh_xyz'));
    });

    test('should handle null or empty fields gracefully', () {
      const response = AuthenticationResponse(
        uid: '',
        email: '',
        authToken: AuthenticationTokenResult(),
      );

      final model = mapper.cast(response);

      expect(model.uid, isEmpty);
      expect(model.email, isEmpty);
      expect(model.authenticationTokenModel.authTime, equals(null));
      expect(model.authenticationTokenModel.expirationTime, equals(null));
      expect(model.authenticationTokenModel.issuedAtTime, equals(null));
      expect(model.authenticationTokenModel.signInProvider, isNull);
      expect(model.authenticationTokenModel.token, isNull);
      expect(model.authenticationTokenModel.refreshToken, isNull);
    });
  });
}
