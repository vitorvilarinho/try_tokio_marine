import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../../user.dart';

abstract class FetchUserByCpfRepository {
  Future<Either<Failure, Profile>> call({
    required String cpf,
  });
}
