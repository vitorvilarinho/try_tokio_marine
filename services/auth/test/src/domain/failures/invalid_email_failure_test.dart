import 'package:auth/src/domain/failures/invalid_email_failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InvalidEmailFailure', () {
    test('should have the correct default message', () {
      const failure = InvalidEmailFailure();
      expect(failure.message, 'invalid_email');
    });

    test('should allow overriding the message', () {
      const customMessage = 'Email format is not valid';
      const failure = InvalidEmailFailure(message: customMessage);
      expect(failure.message, customMessage);
    });

    test('should allow passing an exception', () {
      final exception = Exception('Some error');
      final failure = InvalidEmailFailure(exception: exception);
      expect(failure.exception, exception);
    });

    test('should allow passing a stack trace', () {
      final stack = StackTrace.current;
      final failure = InvalidEmailFailure(stack: stack);
      expect(failure.stack, stack);
    });

    test('should support equality', () {
      const failure1 = InvalidEmailFailure();
      const failure2 = InvalidEmailFailure();
      expect(failure1, equals(failure2));
    });

    test('should support toString', () {
      const failure = InvalidEmailFailure();
      expect(failure.toString(), contains('invalid_email'));
    });
  });
}
