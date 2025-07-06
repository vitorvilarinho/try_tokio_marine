import 'package:core/core.dart';

class UserNotFoundedFailure extends Failure {
  const UserNotFoundedFailure({
    super.message = _message,
  });

  static const _message = 'user_not_founded';
}
