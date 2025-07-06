import 'package:core/core.dart';

class LoggedUserNotFoundedFailure extends Failure {
  LoggedUserNotFoundedFailure({super.message = _message});

  static const _message = 'logged_user_not_founded';
}
