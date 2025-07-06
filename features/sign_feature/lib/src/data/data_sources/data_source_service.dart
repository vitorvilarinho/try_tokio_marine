import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class DataSourceService {
  Future<Either<Failure, String>> fetchEmailByCpf({
    required String cpf,
  });

  Future<Either<Failure, AuthenticationModel>> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> signUpWithEmailPassword({
    required SignUpModel signUpModel,
  });
}
