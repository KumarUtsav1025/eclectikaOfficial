part of 'splashScreenCubit.dart';

@immutable
abstract class SplashScreenState extends Equatable {
  const SplashScreenState();
  @override
  List<Object> get props => [];
}


class SplashScreenLoading extends SplashScreenState {
  const SplashScreenLoading();
}

class SplashScreenSuccess extends SplashScreenState {

  final User user;
  const SplashScreenSuccess(this.user);
  @override
  List<Object> get props => [user];
}

class SplashScreenError extends SplashScreenState {
  final String message;
  const SplashScreenError(this.message);
  @override
  List<Object> get props => [message];
}
