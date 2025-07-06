import 'package:design_system/design_system.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/sign.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    required SignCubit cubit,
    super.key,
  }) : _cubit = cubit;

  final SignCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignCubit, SignState>(builder: (_, state) {
      return Form(
        key: _cubit.signUpFormKey,
        child: Column(
          children: [
            TextFormField(),
            const SizedBox(height: TokioMarineSpacing.of_5),
            RoundedTextInputField(
              controller: _cubit.signUpFirstNameController,
              labelText: 'Primeiro nome',
              enabled: state is! SignLoadingState,
              textCapitalization: TextCapitalization.words,
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Digite o seu primeiro nome';
                }
                return null;
              },
            ),
            const SizedBox(height: TokioMarineSpacing.of_4),
            RoundedTextInputField(
              controller: _cubit.signUpLastnameController,
              labelText: 'Sobrenome',
              enabled: state is! SignLoadingState,
              textCapitalization: TextCapitalization.words,
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Digite o seu primeiro nome';
                }
                return null;
              },
            ),
            const SizedBox(height: TokioMarineSpacing.of_4),
            RoundedTextInputField(
              controller: _cubit.signUpEmailController,
              labelText: 'E-mail',
              enabled: state is! SignLoadingState,
              textCapitalization: TextCapitalization.none,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Digite o seu e-mail';
                }
                return null;
              },
            ),
            const SizedBox(height: TokioMarineSpacing.of_4),
            RoundedTextInputField(
              controller: _cubit.signUpCpfController,
              labelText: 'CPF',
              enabled: state is! SignLoadingState,
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
              controller: _cubit.signUpPasswordController,
              labelText: 'Senha',
              obscureText: true,
              enabled: state is! SignLoadingState,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Digite a senha';
                }
                return null;
              },
            ),
            const SizedBox(height: TokioMarineSpacing.of_4),
            Center(
              child: RoundedNextButton(
                loading: state is SignLoadingState,
                onPressed:
                    state is SignLoadingState ? null : () => _cubit.signUp(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
