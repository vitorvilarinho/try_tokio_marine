import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:user/user.dart';

import '../repositories/fetch_logged_user_repository.dart';

class FetchLoggedUserUsecase {
  const FetchLoggedUserUsecase({
    required FetchLoggedUserRepository fetchLoggedUserRepository,
  }) : _fetchLoggedUserRepository = fetchLoggedUserRepository;

  final FetchLoggedUserRepository _fetchLoggedUserRepository;

  Future<Either<Failure, Profile>> call() => _fetchLoggedUserRepository();
}
