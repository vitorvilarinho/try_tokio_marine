import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:user/user.dart';

import '../models/data_models.dart';

abstract class DataSourceService {
  Future<Either<Failure, AuthenticationResponse>> signInWithEmailAndPassword({
    required AuthenticationRequest authenticationRequest,
  });

  Future<Either<Failure, AuthenticationResponse>> signUpWithEmailAndPassword({
    required SignUpRequest signUpRequest,
  });

  Future<void> signOut();

  Future<bool> hasUser();

  Future<void> removeUser();

  Future<Either<Failure, Profile>> fetchLoggedUser();
}
