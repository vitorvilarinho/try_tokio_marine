import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../failures/user_not_founded_failure.dart';
import '../models/models.dart';
import '../repositories/fetch_user_by_cpf_repository.dart';
import '../repositories/fetch_user_by_uid_repository.dart';

class FetchUserUsecase {
  const FetchUserUsecase({
    required FetchUserByUidRepository fetchUserByUidRepository,
    required FetchUserByCpfRepository fetchUserByCpfRepository,
  })  : _fetchUserByUidRepository = fetchUserByUidRepository,
        _fetchUserByCpfRepository = fetchUserByCpfRepository;

  final FetchUserByUidRepository _fetchUserByUidRepository;
  final FetchUserByCpfRepository _fetchUserByCpfRepository;

  Future<Either<Failure, Profile>> call({
    String? cpf,
    String? uid,
  }) async {
    if ((cpf?.isEmpty ?? true) && (uid?.isEmpty ?? true)) {
      return const Left(UserNotFoundedFailure());
    }
    return (cpf?.isNotEmpty ?? false)
        ? _fetchUserByCpfRepository(cpf: cpf!)
        : _fetchUserByUidRepository(uid: uid!);
  }
}
