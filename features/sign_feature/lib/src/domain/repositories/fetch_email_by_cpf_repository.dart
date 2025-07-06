import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class FetchEmailByCpfRepository {
  Future<Either<Failure, String>> call({required String cpf});
}
