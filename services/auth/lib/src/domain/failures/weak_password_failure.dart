import 'package:core/core.dart';

/// A failure that represents when password is a weak one.
/// This class extends the [Failure] class and provides a default message
/// and optional exception and stack trace.
/// It is used to indicate that an authentication operation has failed
/// because the password provided is weak.
/// This failure is typically used in the context of user registration
/// or account creation, where the system checks if the password
/// meets certain strength criteria.
/// The [WeakPasswordFailure] class is a subclass of [Failure]
/// and provides a specific message indicating that the password is weak.
class WeakPasswordFailure extends Failure {
  /// Creates an instance of [WeakPasswordFailure].
  /// The [message] parameter is optional and defaults to a specific message
  /// indicating that the password is weak.
  /// The [exception] parameter is optional and can be used to provide
  /// additional information about the failure.
  /// The [stack] parameter is optional and can be used to provide
  /// the stack trace of the failure.
  /// The [WeakPasswordFailure] class is a subclass of [Failure]
  /// and provides a specific message indicating that the password is weak.
  const WeakPasswordFailure({
    super.message = _message,
    super.exception,
    super.stack,
  });

  /// A constant that represents the default message for this failure.
  static const _message = 'weak_password';
}
