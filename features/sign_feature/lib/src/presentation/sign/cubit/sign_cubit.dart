import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/use_cases.dart';
import 'sign_state.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit({
    required SignInUsecase signInUsecase,
    required SignUpUsecase signUpUsecase,
  })  : _signInUsecase = signInUsecase,
        _signUpUsecase = signUpUsecase,
        super(const SignInitialState());

  final signUpFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();
  final TextEditingController signInCpfController = TextEditingController();
  final TextEditingController signInPasswordController =
      TextEditingController();
  final TextEditingController signUpFirstNameController =
      TextEditingController();
  final TextEditingController signUpLastnameController =
      TextEditingController();
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpCpfController = TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();

  final SignInUsecase _signInUsecase;
  final SignUpUsecase _signUpUsecase;

  void changeTab(int tabIndex) => emit(SignInitialState(tabIndex: tabIndex));

  Future<void> signIn() async {
    if (signInFormKey.currentState?.validate() ?? false) {
      emit(SignLoadingState(tabIndex: state.tabIndex));

      final result = await _signInUsecase(
        cpf: _sanitizeCpfDocumentNumber(signInCpfController.text),
        password: signInPasswordController.text,
      );

      result.fold(
        (failure) => emit(SignErrorState(
          message: failure.message,
          tabIndex: state.tabIndex,
        )),
        (_) => emit(SignSuccessState(tabIndex: state.tabIndex)),
      );
    }
  }

  Future<void> signUp() async {
    if (signUpFormKey.currentState?.validate() ?? false) {
      emit(SignLoadingState(tabIndex: state.tabIndex));

      final result = await _signUpUsecase(
          signUpModel: SignUpModel(
        firstName: signUpFirstNameController.text,
        lastName: signUpLastnameController.text,
        cpf: _sanitizeCpfDocumentNumber(signUpCpfController.text),
        email: signUpEmailController.text,
        password: signUpPasswordController.text,
      ));

      result.fold(
        (failure) => emit(SignErrorState(
          message: failure.message,
          tabIndex: state.tabIndex,
        )),
        (_) => emit(SignSuccessState(tabIndex: state.tabIndex)),
      );
    }
  }

  String _sanitizeCpfDocumentNumber(String cpf) =>
      cpf.replaceAll(RegExp(r'\D'), '');
}
