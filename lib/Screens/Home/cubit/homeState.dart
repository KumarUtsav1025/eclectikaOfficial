part of 'homeCubit.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}


class HomeLoading extends HomeState {
  const HomeLoading();
}


class HomeSuccess extends HomeState {
  HomeSuccess(this.userProfile);
  UserProfile userProfile;

  @override
  List<Object> get props => [userProfile];
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);
  @override
  List<Object> get props => [message];
}
