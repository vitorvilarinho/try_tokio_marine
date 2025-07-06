import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cubit/tokio_marine_cubit.dart';
import 'cubit/tokio_marine_state.dart';

class TokioMarineScreen extends StatelessWidget {
  const TokioMarineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TokioMarineCubit>.value(
      value: Modular.get<TokioMarineCubit>()..init(),
      child: BlocListener<TokioMarineCubit, TokioMarineState>(
        listener: (_, state) {
          if (state is TokioMarineAuthenticatedState) {
            Modular.to.navigate('/home/');
          }
        },
        child: MaterialApp.router(
          title: 'Tokio Marine',
          theme: ThemeData(primarySwatch: Colors.blue),
          routerConfig: Modular.routerConfig,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
