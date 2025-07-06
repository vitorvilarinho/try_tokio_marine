import 'package:auth/src/domain/failures/wrong_password_failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WrongPasswordFailure', () {
    test('should have the correct default message', () {
      const failure = WrongPasswordFailure();
      expect(failure.message, equals('wrong_password'));
    });

    test('should allow overriding the message', () {
      const customMessage = 'Senha incorreta';
      const failure = WrongPasswordFailure(message: customMessage);
      expect(failure.message, equals(customMessage));
    });

    test('should store the exception if provided', () {
      final exception = Exception('Some error');
      final failure = WrongPasswordFailure(exception: exception);
      expect(failure.exception, equals(exception));
    });

    test('should store the stack trace if provided', () {
      final stack = StackTrace.current;
      final failure = WrongPasswordFailure(stack: stack);
      expect(failure.stack, equals(stack));
    });

    test('should be a subclass of Failure', () {
      const failure = WrongPasswordFailure();
      expect(failure, isA<WrongPasswordFailure>());
    });

    test('should support toString', () {
      const failure = WrongPasswordFailure();
      expect(failure.toString(), contains('wrong_password'));
    });
  });
}
