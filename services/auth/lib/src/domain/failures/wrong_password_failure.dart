import 'package:core/core.dart';

/// A failure that represents when the password is not right with the e-mail
/// provided. This class extends the [Failure] class and provides a default
/// message and optional exception and stack trace.
/// It is used to indicate that an authentication operation has failed
/// because the password provided is not correct.
/// This failure is typically used in the context of user login
/// or authentication, where the system checks if the password
/// matches the email address provided.
/// The [WrongPasswordFailure] class is a subclass of [Failure]
/// and provides a specific message indicating that the password is not correct.
class WrongPasswordFailure extends Failure {
  /// Creates an instance of [WrongPasswordFailure].
  /// The [message] parameter is optional and defaults to a specific message
  /// indicating that the password is not correct.
  /// The [exception] parameter is optional and can be used to provide
  /// additional information about the failure.
  /// The [stack] parameter is optional and can be used to provide
  /// the stack trace of the failure.
  /// The [WrongPasswordFailure] class is a subclass of [Failure]
  /// and provides a specific message indicating that the password
  /// is not correct.
  const WrongPasswordFailure({
    super.message = _message,
    super.exception,
    super.stack,
  });

  /// A constant that represents the default message for this failure.
  static const _message = 'wrong_password';
}
