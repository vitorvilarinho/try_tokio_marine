import 'package:core/core.dart';

class SaveDatabaseFailure extends Failure {
  const SaveDatabaseFailure({
    super.message = _message,
    super.exception,
    super.stack,
  });

  static const _message = 'sign_up_failure_message';
}
