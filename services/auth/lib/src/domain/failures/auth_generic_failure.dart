import 'package:core/core.dart';

/// A failure that represents a generic authentication error.
/// This class extends the [Failure] class and provides a default message
/// and optional exception and stack trace.
/// It is used to indicate that an authentication operation has failed
/// without specifying the exact reason for the failure.
class AuthGenericFailure extends Failure {
  /// Creates an instance of [AuthGenericFailure].
  /// The [message] parameter is optional and defaults to a generic message.
  /// The [exception] parameter is optional and can be used to provide
  /// additional information about the failure.
  /// The [stack] parameter is optional and can be used to provide
  /// the stack trace of the failure.
  const AuthGenericFailure({
    super.message = _message,
    super.exception,
    super.stack,
  });

  /// A constant that represents the default message for this failure.
  static const _message = 'auth_generic_failure';
}
