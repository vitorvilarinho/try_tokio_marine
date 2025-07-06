import 'package:core/core.dart';

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure({
    super.message = _message,
  });

  static const _message =
      'Não foi possível encontrar o usuário a partir do CPF informado';
}
