import 'package:auth/src/domain/models/authentication_model.dart';
import 'package:auth/src/domain/models/authentication_token_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthenticationModel', () {
    const uid = 'user-123';
    const email = 'user@example.com';
    const token = 'token-abc';
    const refreshToken = 'refresh-xyz';

    const authenticationTokenModel = AuthenticationTokenModel(
      token: token,
      refreshToken: refreshToken,
    );

    test('should create an instance with correct values', () {
      const model = AuthenticationModel(
        uid: uid,
        email: email,
        authenticationTokenModel: authenticationTokenModel,
      );

      expect(model.uid, uid);
      expect(model.email, email);
      expect(model.authenticationTokenModel, authenticationTokenModel);
    });

    test('should support value equality', () {
      const model1 = AuthenticationModel(
        uid: uid,
        email: email,
        authenticationTokenModel: authenticationTokenModel,
      );
      const model2 = AuthenticationModel(
        uid: uid,
        email: email,
        authenticationTokenModel: authenticationTokenModel,
      );

      expect(model1, equals(model2));
      expect(model1.hashCode, equals(model2.hashCode));
    });

    test('should not be equal if any property differs', () {
      const model1 = AuthenticationModel(
        uid: uid,
        email: email,
        authenticationTokenModel: authenticationTokenModel,
      );
      const model2 = AuthenticationModel(
        uid: 'different-uid',
        email: email,
        authenticationTokenModel: authenticationTokenModel,
      );
      const model3 = AuthenticationModel(
        uid: uid,
        email: 'different@example.com',
        authenticationTokenModel: authenticationTokenModel,
      );
      const model4 = AuthenticationModel(
        uid: uid,
        email: email,
        authenticationTokenModel: AuthenticationTokenModel(
          token: 'different-token',
          refreshToken: refreshToken,
        ),
      );

      expect(model1 == model2, isFalse);
      expect(model1 == model3, isFalse);
      expect(model1 == model4, isFalse);
    });

    test('props should contain all fields', () {
      const model = AuthenticationModel(
        uid: uid,
        email: email,
        authenticationTokenModel: authenticationTokenModel,
      );

      expect(model.props, [uid, email, authenticationTokenModel]);
    });
  });
}
