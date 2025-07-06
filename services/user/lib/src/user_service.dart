import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import 'data/data_sources/data_source_service.dart';
import 'data/data_sources/firebase/firebase_remote_service.dart';
import 'data/repositories/repositories.dart';
import 'domain/models/profile.dart';
import 'domain/use_cases/use_cases.dart';
import 'user_service_impl.dart';

abstract class UserService {
  static UserService? _instance;
  static UserService get instance {
    DataSourceService? dataSourceService;
    return _instance ??= UserServiceImpl(
      insertProfileUsecase: InsertProfileUsecase(
        insertProfileRepository: InsertProfileRepositoryImpl(
          dataSourceService: dataSourceService ??= FirebaseRemoteService(),
        ),
      ),
      fetchUserByUidUsecase: FetchUserUsecase(
        fetchUserByCpfRepository: FetchUserByCpfRepositoryImpl(
          dataSourceService: dataSourceService,
        ),
        fetchUserByUidRepository: FetchUserByUidRepositoryImpl(
          dataSourceService: dataSourceService,
        ),
      ),
    );
  }

  Future<Either<Failure, Profile>> saveProfile({
    required Profile profile,
  });

  Future<Either<Failure, Profile>> fetchProfile({String? cpf, String? uid});
}
