import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import 'domain/models/profile.dart';
import 'domain/use_cases/use_cases.dart';
import 'user_service.dart';

class UserServiceImpl implements UserService {
  const UserServiceImpl({
    required InsertProfileUsecase insertProfileUsecase,
    required FetchUserUsecase fetchUserByUidUsecase,
  })  : _insertProfileUsecase = insertProfileUsecase,
        _fetchUserByUidUsecase = fetchUserByUidUsecase;

  final InsertProfileUsecase _insertProfileUsecase;
  final FetchUserUsecase _fetchUserByUidUsecase;

  @override
  Future<Either<Failure, Profile>> saveProfile({
    required Profile profile,
  }) =>
      _insertProfileUsecase(profile: profile);

  @override
  Future<Either<Failure, Profile>> fetchProfile({String? cpf, String? uid}) =>
      _fetchUserByUidUsecase(cpf: cpf, uid: uid);
}
