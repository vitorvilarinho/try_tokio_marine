import 'package:auth/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'tokio_marine_state.dart';

class TokioMarineCubit extends Cubit<TokioMarineState> {
  TokioMarineCubit({
    required AuthService authService,
  })  : _authService = authService,
        super(const TokioMarineLoadingState());

  final AuthService _authService;

  Future<void> init() async {
    final isAuthenticated = await _authService.isAuthenticated;
    if (isAuthenticated) {
      emit(const TokioMarineAuthenticatedState());
    }
  }
}
