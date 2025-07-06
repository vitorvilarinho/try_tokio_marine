import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cubit/sign.dart';
import 'widgets/sign_in_form_widget.dart';
import 'widgets/sign_up_form_widget.dart';
import 'widgets/tab_head_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    required SignCubit cubit,
    Key? key,
  })  : _cubit = cubit,
        super(key: key);

  final SignCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignCubit>.value(
      value: _cubit,
      child: BlocListener<SignCubit, SignState>(
        listener: (context, state) {
          if (state is SignSuccessState) {
            Modular.to.navigate('/home/');
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xFF23232B),
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: TokioMarineColors.greenYellowGradinte,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: kIsWeb
                        ? EdgeInsets.zero
                        : const EdgeInsets.symmetric(
                            horizontal: TokioMarineSpacing.of_4),
                    child: Column(
                      crossAxisAlignment: kIsWeb
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: TokioMarineSpacing.of_6),
                        TokioMarineLogo.white(),
                        const SizedBox(height: TokioMarineSpacing.of_4),
                        // Bem vindo
                        const Text(
                          'Bem vindo!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: TokioMarineSpacing.of_2),
                        const Text(
                          'Aqui você gerencia seus seguros e de seus familiares '
                          '\nem poucos cliques!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: TokioMarineSpacing.of_6),
                        // Card central
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: kIsWeb ? 450 : double.infinity,
                          ),
                          child: Card(
                            color: const Color(0xFF23232B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 8,
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(TokioMarineSpacing.of_4),
                              child: BlocBuilder<SignCubit, SignState>(
                                builder: (_, state) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      TabHeadWidget(
                                        tabs: const [
                                          'Entrar',
                                          'Cadastrar',
                                        ],
                                        selectedIndexTab: state.tabIndex,
                                        onTabChanged: (tabIndex) =>
                                            _cubit.changeTab(tabIndex),
                                      ),
                                      if (state.tabIndex == 0)
                                        SignInFormWidget(
                                          cubit: _cubit,
                                        ),
                                      if (state.tabIndex == 1)
                                        SignUpFormWidget(
                                          cubit: _cubit,
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: TokioMarineSpacing.of_2),
                        const Column(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xFF4FC3A1),
                              size: TokioMarineSpacing.of_6,
                            ),
                            SizedBox(height: TokioMarineSpacing.of_2),
                            Text(
                              'Tokio Tesolve',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: TokioMarineSpacing.of_2),
                            Text(
                              'Acesse através das redes sociais',
                              style: TextStyle(color: Colors.white70),
                            ),
                            SizedBox(height: TokioMarineSpacing.of_3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TokioMarineImage(
                                  'assets/google.svg',
                                  width: 30,
                                ),
                                SizedBox(width: TokioMarineSpacing.of_6),
                                TokioMarineImage(
                                  'assets/facebook.svg',
                                  width: 30,
                                ),
                                SizedBox(width: TokioMarineSpacing.of_6),
                                TokioMarineImage(
                                  'assets/x.svg',
                                  width: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
