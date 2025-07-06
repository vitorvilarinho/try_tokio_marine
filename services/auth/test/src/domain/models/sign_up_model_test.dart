import 'package:auth/src/domain/models/sign_up_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignUpModel', () {
    test('should create a valid SignUpModel instance', () {
      const model = SignUpModel(
        email: 'john.doe@example.com',
        password: 'password123',
        firstName: 'John',
        lastName: 'Doe',
        middleName: 'M',
        urlProfileAvatar: 'https://example.com/photo.jpg',
      );

      expect(model.email, 'john.doe@example.com');
      expect(model.password, 'password123');
      expect(model.firstName, 'John');
      expect(model.lastName, 'Doe');
      expect(model.middleName, 'M');
      expect(model.urlProfileAvatar, 'https://example.com/photo.jpg');
    });

    test('should support value equality', () {
      const model1 = SignUpModel(
        email: 'john.doe@example.com',
        password: 'password123',
        firstName: 'John',
        lastName: 'Doe',
        middleName: 'M',
        urlProfileAvatar: 'https://example.com/photo.jpg',
      );
      const model2 = SignUpModel(
        email: 'john.doe@example.com',
        password: 'password123',
        firstName: 'John',
        lastName: 'Doe',
        middleName: 'M',
        urlProfileAvatar: 'https://example.com/photo.jpg',
      );

      expect(model1, equals(model2));
    });

    test('should not be equal if email is different', () {
      const model1 = SignUpModel(
        email: 'john.doe@example.com',
        password: 'password123',
        firstName: 'John',
        lastName: 'Doe',
        middleName: 'M',
        urlProfileAvatar: 'https://example.com/photo.jpg',
      );
      const model2 = SignUpModel(
        email: 'jane.doe@example.com',
        password: 'password123',
        firstName: 'John',
        lastName: 'Doe',
        middleName: 'M',
        urlProfileAvatar: 'https://example.com/photo.jpg',
      );

      expect(model1, isNot(equals(model2)));
    });

    test('should not be equal if profile is different', () {
      const model1 = SignUpModel(
        email: 'john.doe@example.com',
        password: 'password123',
        firstName: 'John',
        lastName: 'Doe',
        middleName: 'M',
        urlProfileAvatar: 'https://example.com/photo.jpg',
      );
      const model2 = SignUpModel(
        email: 'john.doe@example.com',
        password: 'password123',
        firstName: 'Jane',
        lastName: 'Doe',
        middleName: 'A',
        urlProfileAvatar: 'https://example.com/photo2.jpg',
      );

      expect(model1, isNot(equals(model2)));
    });

    test('props should contain email and profile', () {
      const model = SignUpModel(
        email: 'john.doe@example.com',
        password: 'password123',
        firstName: 'John',
        lastName: 'Doe',
        middleName: 'M',
        urlProfileAvatar: 'https://example.com/photo.jpg',
      );

      expect(
          model.props,
          containsAll([
            model.email,
            model.password,
            model.firstName,
            model.lastName,
            model.middleName,
            model.urlProfileAvatar,
          ]));
      expect(model.props.length, 6);
    });
  });
}
