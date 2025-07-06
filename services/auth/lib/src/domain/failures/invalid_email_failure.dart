import 'package:core/core.dart';

/// A failure that represents when the email address is not valid.
/// /// This class extends the [Failure] class and provides a default message
/// and optional exception and stack trace.
/// It is used to indicate that an authentication operation has failed
/// because the email address provided is not valid.
/// This failure is typically used in the context of user registration
/// or account creation, where the system checks if the email address
/// is in a valid format.
/// The [InvalidEmailFailure] class is a subclass of [Failure
class InvalidEmailFailure extends Failure {
  /// Creates an instance of [InvalidEmailFailure].
  /// The [message] parameter is optional and defaults to a specific message
  /// indicating that the email is invalid.
  /// The [exception] parameter is optional and can be used to provide
  /// additional information about the failure.
  /// The [stack] parameter is optional and can be used to provide
  /// the stack trace of the failure.
  /// The [InvalidEmailFailure] class is a subclass of [Failure]
  const InvalidEmailFailure({
    super.message = _message,
    super.exception,
    super.stack,
  });

  /// A constant that represents the default message for this failure.
  static const _message = 'invalid_email';
}
