import 'package:core/core.dart';

/// A failure that represents when an email is already in use.
/// This class extends the [Failure] class and provides a default message
/// and optional exception and stack trace.
/// It is used to indicate that an authentication operation has failed
/// because the email address provided is already associated with an existing
/// account.
/// This failure is typically used in the context of user registration
/// or account creation, where the system checks if the email address
/// is already registered.
/// The [EmailAlreadyInUseFailure] class is a subclass of [Failure
class EmailAlreadyInUseFailure extends Failure {
  /// Creates an instance of [EmailAlreadyInUseFailure].
  /// The [message] parameter is optional and defaults to a specific message
  /// indicating that the email is already in use.
  /// The [exception] parameter is optional and can be used to provide
  /// additional information about the failure.
  /// The [stack] parameter is optional and can be used to provide
  /// the stack trace of the failure.
  const EmailAlreadyInUseFailure({
    super.message = _message,
    super.exception,
    super.stack,
  });

  /// A constant that represents the default message for this failure.
  /// This message indicates that the email address provided is already
  /// associated with an existing account.
  static const _message = 'email_already_in_use';
}
