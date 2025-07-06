import 'package:auth/auth.dart';
import 'package:db_firestore/db_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_feature/home_feature.dart';
import 'package:sign_feature/sign_feature.dart';

import '../../presentation/app/cubit/tokio_marine_cubit.dart';
import 'guards/auth_guard.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: SignModule());
    r.module('/home', module: HomeModule(), guards: [
      AuthGuard(),
    ]);

    super.routes(r);
  }

  @override
  void binds(Injector i) {
    i.addSingleton<AuthService>(() => AuthService.instance);
    i.addLazySingleton<DbFirestoreService>(() => DbFirestoreService.instance);
    i.addLazySingleton<TokioMarineCubit>(() => TokioMarineCubit(
          authService: i.get<AuthService>(),
        ));

    super.binds(i);
  }
}
