import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../../user.dart';

abstract class InsertProfileRepository {
  Future<Either<Failure, Profile>> call({required Profile profile});
}
