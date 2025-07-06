import 'package:equatable/equatable.dart';

sealed class SignState extends Equatable {
  const SignState({
    this.tabIndex = 0,
  });

  final int tabIndex;

  @override
  List<Object?> get props => [tabIndex];
}

class SignInitialState extends SignState {
  const SignInitialState({
    super.tabIndex,
  });
}

class SignLoadingState extends SignState {
  const SignLoadingState({
    super.tabIndex,
  });
}

class SignSuccessState extends SignState {
  const SignSuccessState({
    super.tabIndex,
  });
}

class SignErrorState extends SignState {
  const SignErrorState({
    required this.message,
    super.tabIndex,
  });

  final String message;

  @override
  List<Object?> get props => [message, super.props];
}
