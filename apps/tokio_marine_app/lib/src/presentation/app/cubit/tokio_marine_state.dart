import 'package:equatable/equatable.dart';

sealed class TokioMarineState extends Equatable {
  const TokioMarineState();

  @override
  List<Object?> get props => [];
}

class TokioMarineAuthenticatedState extends TokioMarineState {
  const TokioMarineAuthenticatedState();

  @override
  List<Object?> get props => [];
}

class TokioMarineLoadingState extends TokioMarineState {
  const TokioMarineLoadingState();

  @override
  List<Object?> get props => [];
}
