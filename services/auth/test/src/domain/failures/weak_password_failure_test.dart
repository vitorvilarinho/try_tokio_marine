import 'package:auth/src/domain/failures/weak_password_failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WeakPasswordFailure', () {
    test('should have the default message', () {
      const failure = WeakPasswordFailure();
      expect(failure.message, 'weak_password');
    });

    test('should allow custom message', () {
      const customMessage = 'Password is too weak!';
      const failure = WeakPasswordFailure(message: customMessage);
      expect(failure.message, customMessage);
    });

    test('should allow exception and stack to be set', () {
      final exception = Exception('Test exception');
      final stack = StackTrace.current;
      final failure = WeakPasswordFailure(
        exception: exception,
        stack: stack,
      );
      expect(failure.exception, exception);
      expect(failure.stack, stack);
    });

    test('should be a subclass of Failure', () {
      const failure = WeakPasswordFailure();
      expect(failure, isA<WeakPasswordFailure>());
    });

    test('should support value equality', () {
      const failure1 = WeakPasswordFailure();
      const failure2 = WeakPasswordFailure();
      expect(failure1, equals(failure2));
    });

    test('should support toString', () {
      const failure = WeakPasswordFailure();
      expect(failure.toString(), contains('weak_password'));
    });
  });
}
