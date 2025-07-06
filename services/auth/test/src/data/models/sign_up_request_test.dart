import 'package:auth/src/data/models/data_models.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../seeds.dart';

void main() {
  group('SignUpRequest', () {
    const authentication = AuthenticationRequest(
      email: 'test@example.com',
      password: 'password123',
    );

    test('should create a valid instance with all fields', () {
      const request = Seeds.profile;

      expect(request.firstName, Seeds.firstName);
      expect(request.lastName, Seeds.lastName);
      expect(request.email, request.email);
      expect(request.cpf, request.cpf);
    });

    test('fullName returns correct value with middleName', () {
      const request = Seeds.profile;

      expect(request.fullName, '${Seeds.firstName} ${Seeds.lastName}');
    });

    test('equality works as expected', () {
      const req1 = SignUpRequest(
        firstName: 'Anna',
        lastName: 'Lee',
        cpf: '123',
        authentication: authentication,
      );
      const req2 = SignUpRequest(
        firstName: 'Anna',
        lastName: 'Lee',
        cpf: '123',
        authentication: authentication,
      );
      const req3 = SignUpRequest(
        firstName: 'Anna',
        lastName: 'Lee',
        cpf: '1234',
        authentication: authentication,
      );

      expect(req1, equals(req2));
      expect(req1, isNot(equals(req3)));
    });
  });
}
