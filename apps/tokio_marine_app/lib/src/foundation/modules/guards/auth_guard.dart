import 'dart:async';

import 'package:auth/auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) =>
      Modular.get<AuthService>().isAuthenticated;

  @override
  String? get redirectTo => '/';
}
