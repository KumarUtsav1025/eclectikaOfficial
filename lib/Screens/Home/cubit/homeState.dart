part of 'homeCubit.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class ProfileLoading extends HomeState {
  const ProfileLoading();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}


class SMSSuccess extends HomeState {
  const SMSSuccess(this.message);
  final String message;

  @override
  List<Object> get props => [message];
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
