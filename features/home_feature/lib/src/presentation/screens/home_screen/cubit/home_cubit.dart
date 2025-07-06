import 'package:auth/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required AuthService authService,
  })  : _authService = authService,
        super(const HomeLoading());

  final AuthService _authService;

  Future<void> init() async {
    final user = await _authService.fetchLoggedUser();

    user.fold(
      (failure) => emit(HomeFailure(failure: failure)),
      (profile) => emit(HomeSuccess(profile: profile)),
    );
  }

  Future<void> signOut() async {
    if (state is HomeSuccess) {
      _authService.signOut();
      emit(HomeSignOut(profile: (state as HomeSuccess).profile));
    }
  }
}
