import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../../user.dart';
import '../models/profile_request.dart';

abstract class DataSourceService {
  Future<Either<Failure, void>> insertProfile({
    required ProfileRequest profile,
  });

  Future<Either<Failure, Profile>> fetchProfileByCpf({
    required String cpf,
  });

  Future<Either<Failure, Profile>> fetchProfileByUid({
    required String uid,
  });
}
