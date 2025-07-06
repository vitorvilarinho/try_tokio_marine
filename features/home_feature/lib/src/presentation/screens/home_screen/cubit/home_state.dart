import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:user/user.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeSuccess extends HomeState {
  const HomeSuccess({
    required this.profile,
  });

  final Profile profile;
}

class HomeFailure extends HomeState {
  const HomeFailure({
    required this.failure,
  });

  final Failure failure;
}

class HomeSignOut extends HomeSuccess {
  const HomeSignOut({
    required super.profile,
  });
}
