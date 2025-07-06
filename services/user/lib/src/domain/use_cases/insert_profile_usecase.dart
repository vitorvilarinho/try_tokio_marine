import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../models/profile.dart';
import '../repositories/insert_profile_repository.dart';

class InsertProfileUsecase {
  const InsertProfileUsecase({
    required InsertProfileRepository insertProfileRepository,
  }) : _insertProfileRepository = insertProfileRepository;

  final InsertProfileRepository _insertProfileRepository;

  Future<Either<Failure, Profile>> call({required Profile profile}) =>
      _insertProfileRepository(profile: profile);
}
