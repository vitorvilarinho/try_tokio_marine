import 'package:auth/src/domain/failures/auth_generic_failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthGenericFailure', () {
    test('should create with default message', () {
      const failure = AuthGenericFailure();
      expect(failure.message, 'auth_generic_failure');
      expect(failure.exception, isNull);
      expect(failure.stack, isNull);
    });

    test('should create with custom message', () {
      const failure = AuthGenericFailure(message: 'custom_message');
      expect(failure.message, 'custom_message');
    });

    test('should create with exception', () {
      final exception = Exception('error');
      final failure = AuthGenericFailure(exception: exception);
      expect(failure.exception, exception);
    });

    test('should create with stack trace', () {
      final stack = StackTrace.current;
      final failure = AuthGenericFailure(stack: stack);
      expect(failure.stack, stack);
    });

    test('should support equality', () {
      const failure1 = AuthGenericFailure();
      const failure2 = AuthGenericFailure();
      expect(failure1, equals(failure2));
    });
  });
}
