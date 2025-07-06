import 'package:auth/src/domain/failures/email_already_in_use_failure.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmailAlreadyInUseFailure', () {
    test('should have the correct default message', () {
      const failure = EmailAlreadyInUseFailure();
      expect(failure.message, 'email_already_in_use');
    });

    test('should allow overriding the message', () {
      const customMessage = 'Custom error message';
      const failure = EmailAlreadyInUseFailure(message: customMessage);
      expect(failure.message, customMessage);
    });

    test('should store the exception if provided', () {
      final exception = Exception('Some exception');
      final failure = EmailAlreadyInUseFailure(exception: exception);
      expect(failure.exception, exception);
    });

    test('should store the stack trace if provided', () {
      final stack = StackTrace.current;
      final failure = EmailAlreadyInUseFailure(stack: stack);
      expect(failure.stack, stack);
    });

    test('should be a subclass of Failure', () {
      const failure = EmailAlreadyInUseFailure();
      expect(failure, isA<Failure>());
    });
  });
}
