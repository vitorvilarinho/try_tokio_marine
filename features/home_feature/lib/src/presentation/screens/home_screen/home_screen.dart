import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required HomeCubit cubit,
    super.key,
  }) : _cubit = cubit;

  final HomeCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>.value(
      value: _cubit..init(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeSignOut) {
            Modular.to.navigate('/');
          }
        },
        builder: (_, state) => switch (state) {
          HomeLoading _ => const LoadingBody(),
          HomeSuccess _ => SuccessBody(
              profile: state.profile,
            ),
          HomeFailure _ => FailureBody(
              failure: state.failure,
            ),
        },
      ),
    );
  }
}
