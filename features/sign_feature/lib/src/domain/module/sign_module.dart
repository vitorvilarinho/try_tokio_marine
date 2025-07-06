import 'package:auth/auth.dart';
import 'package:db_firestore/db_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/data_sources/data_source_service.dart';
import '../../data/data_sources/remote_data_service.dart';
import '../../data/repositories/repositories.dart';
import '../../presentation/sign/cubit/sign_cubit.dart';
import '../../presentation/sign/sign_screen.dart';
import '../use_cases/use_cases.dart';

class SignModule extends Module {
  @override
  void binds(Injector i) {
    // final temp = Modular.get<AuthService>();
    // final temp2 = Modular.get<DbFirestoreService>();
    // debugPrint('binds: ${temp.hashCode}');

    /// [DataSourceService] singleton instance.
    i.addSingleton<DataSourceService>(
      () => RemoteDataService(
        authService: Modular.get<AuthService>(),
        dbService: Modular.get<DbFirestoreService>(),
      ),
    );

    /// [SignCubit] instance.
    i.addInstance<SignCubit>(
      SignCubit(
        signInUsecase: SignInUsecase(
          fetchEmailByCpfRepository: FetchEmailByCpfRepositoryImpl(
            dataSource: i.get<DataSourceService>(),
          ),
          signInWithEmailPasswordRepository:
              SignInWithEmailPasswordRepositoryImpl(
            dataSource: i.get<DataSourceService>(),
          ),
        ),
        signUpUsecase: SignUpUsecase(
          signUpUserRepository: SignUpUserRepositoryImpl(
            dataSource: i.get<DataSourceService>(),
          ),
        ),
      ),
    );

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => SignInScreen(
        cubit: Modular.get<SignCubit>(),
      ),
    );

    super.routes(r);
  }
}
