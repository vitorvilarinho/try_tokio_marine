import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:user/user.dart';

abstract class FetchLoggedUserRepository {
  Future<Either<Failure, Profile>> call();
}
