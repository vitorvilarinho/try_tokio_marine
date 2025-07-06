import 'package:auth/src/domain/models/sign_up_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../seeds.dart';

void main() {
  group('SignUpModel', () {
    test('should create a valid SignUpModel instance', () {
      const model = Seeds.signUpModelodel;

      expect(model.email, Seeds.email);
      expect(model.password, Seeds.password);
      expect(model.firstName, Seeds.firstName);
      expect(model.lastName, Seeds.lastName);
      expect(model.cpf, Seeds.cpf);
    });

    test('should support value equality', () {
      const model1 = SignUpModel(
        email: Seeds.email,
        password: Seeds.password,
        firstName: Seeds.firstName,
        lastName: Seeds.lastName,
        cpf: Seeds.cpf,
      );
      const model2 = Seeds.signUpModelodel;

      expect(model1, equals(model2));
    });

    test('should not be equal if email is different', () {
      const model1 = SignUpModel(
        email: Seeds.email,
        password: Seeds.password,
        firstName: Seeds.firstName,
        lastName: Seeds.lastName,
        cpf: Seeds.cpf,
      );
      const model2 = SignUpModel(
        email: 'jane.doe@example.com',
        password: Seeds.password,
        firstName: Seeds.firstName,
        lastName: Seeds.lastName,
        cpf: Seeds.cpf,
      );

      expect(model1, isNot(equals(model2)));
    });

    test('should not be equal if profile is different', () {
      const model1 = SignUpModel(
        email: Seeds.email,
        password: Seeds.password,
        firstName: Seeds.firstName,
        lastName: Seeds.lastName,
        cpf: Seeds.cpf,
      );
      const model2 = SignUpModel(
        email: Seeds.email,
        password: Seeds.password,
        firstName: 'Jane',
        lastName: 'Doe',
        cpf: Seeds.cpf,
      );

      expect(model1, isNot(equals(model2)));
    });

    test('props should contain email and profile', () {
      const model = SignUpModel(
        email: Seeds.email,
        password: Seeds.password,
        firstName: Seeds.firstName,
        lastName: Seeds.lastName,
        cpf: Seeds.cpf,
      );

      expect(
          model.props,
          containsAll([
            model.email,
            model.password,
            model.firstName,
            model.lastName,
            model.cpf,
          ]));
      expect(model.props.length, 5);
    });
  });
}
