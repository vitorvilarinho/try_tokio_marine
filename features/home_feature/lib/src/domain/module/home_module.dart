import 'package:auth/auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../presentation/screens/home_screen/cubit/home_cubit.dart';
import '../../presentation/screens/home_screen/home_screen.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance<HomeCubit>(
      HomeCubit(
        authService: Modular.get<AuthService>(),
      ),
    );

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => HomeScreen(
        cubit: Modular.get<HomeCubit>(),
      ),
    );

    super.routes(r);
  }
}
