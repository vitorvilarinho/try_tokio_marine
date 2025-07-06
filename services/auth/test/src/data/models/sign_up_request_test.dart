import 'package:auth/src/data/models/data_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignUpRequest', () {
    const authentication = AuthenticationRequest(
      email: 'test@example.com',
      password: 'password123',
    );

    test('should create a valid instance with all fields', () {
      const request = SignUpRequest(
        firstName: 'John',
        lastName: 'Doe',
        middleName: 'M',
        urlProfileAvatar: 'http://avatar.com/img.png',
        authentication: authentication,
      );

      expect(request.firstName, 'John');
      expect(request.lastName, 'Doe');
      expect(request.middleName, 'M');
      expect(request.urlProfileAvatar, 'http://avatar.com/img.png');
      expect(request.authentication, authentication);
    });

    test('should create a valid instance with optional fields as null', () {
      const request = SignUpRequest(
        firstName: 'Jane',
        lastName: 'Smith',
        authentication: authentication,
      );

      expect(request.middleName, isNull);
      expect(request.urlProfileAvatar, isNull);
    });

    test('fullName returns correct value with middleName', () {
      const request = SignUpRequest(
        firstName: 'Alice',
        lastName: 'Johnson',
        middleName: 'B',
        authentication: authentication,
      );

      expect(request.fullName, 'Alice B Johnson');
    });

    test('fullName returns correct value without middleName', () {
      const request = SignUpRequest(
        firstName: 'Bob',
        lastName: 'Brown',
        authentication: authentication,
      );

      expect(request.fullName, 'Bob Brown');
    });

    test('fullName returns correct value with empty middleName', () {
      const request = SignUpRequest(
        firstName: 'Eve',
        lastName: 'White',
        middleName: '',
        authentication: authentication,
      );

      expect(request.fullName, 'Eve White');
    });

    test('props contains all relevant fields', () {
      const request = SignUpRequest(
        firstName: 'Sam',
        lastName: 'Green',
        middleName: 'T',
        authentication: authentication,
      );

      expect(
        request.props,
        containsAll([
          'Sam',
          'Green',
          'T',
          authentication,
        ]),
      );
    });

    test('equality works as expected', () {
      const req1 = SignUpRequest(
        firstName: 'Anna',
        lastName: 'Lee',
        middleName: 'C',
        authentication: authentication,
      );
      const req2 = SignUpRequest(
        firstName: 'Anna',
        lastName: 'Lee',
        middleName: 'C',
        authentication: authentication,
      );
      const req3 = SignUpRequest(
        firstName: 'Anna',
        lastName: 'Lee',
        authentication: authentication,
      );

      expect(req1, equals(req2));
      expect(req1, isNot(equals(req3)));
    });
  });
}
