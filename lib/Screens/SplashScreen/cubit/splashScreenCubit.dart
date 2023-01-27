import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../Constants/strings.dart';
import '../../../Modals/errors.dart';
import '../splashScreenNetwork.dart';


part 'splashScreenState.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  final SplashNetwork _splashNetwork;
  SplashScreenCubit(this._splashNetwork) : super(SplashScreenLoading());

  Future<void> getProfile()async {
    try {
      emit(const SplashScreenLoading());
      User user= await _splashNetwork.getProfile();
      emit(SplashScreenSuccess(user));
    } on CustomException catch(e) {
      emit(SplashScreenError(e.description));
    } catch (e) {
      print(e);
    }
  }

}
