import 'package:design_system/design_system.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/sign.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({
    required SignCubit cubit,
    super.key,
  }) : _cubit = cubit;

  final SignCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignCubit, SignState>(
      builder: (_, state) {
        return Form(
          key: _cubit.signInFormKey,
          child: Column(
            children: [
              const SizedBox(height: TokioMarineSpacing.of_5),
              if (state is SignErrorState) ...[
                Text(
                  state.message,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: TokioMarineSpacing.of_4),
              ],
              RoundedTextInputField(
                controller: _cubit.signInCpfController,
                labelText: 'CPF',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  TextInputMask(mask: '999.999.999-99'),
                ],
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Digite o CPF';
                  }
                  return null;
                },
              ),
              const SizedBox(height: TokioMarineSpacing.of_4),
              RoundedTextInputField(
                controller: _cubit.signInPasswordController,
                labelText: 'Senha',
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Digite a senha';
                  }
                  return null;
                },
              ),
              const SizedBox(height: TokioMarineSpacing.of_4),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        activeColor: const Color(0xFF4FC3A1),
                      ),
                      const Text(
                        'Lembrar Sempre',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: Color(0xFF4FC3A1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TokioMarineSpacing.of_4),
              Center(
                child: RoundedNextButton(
                  loading: state is SignLoadingState,
                  onPressed: () => context.read<SignCubit>().signIn(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
