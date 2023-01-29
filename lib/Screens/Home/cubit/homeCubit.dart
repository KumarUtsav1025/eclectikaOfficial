import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../Constants/strings.dart';
import '../../../Modals/errors.dart';
import '../../../Modals/users.dart';
import '../network.dart';


part 'homeState.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeNetwork _homeNetwork;
  HomeCubit(this._homeNetwork) : super(const HomeLoading());

  Future<void> getUser() async {
    try {
      emit(HomeLoading());
      UserProfile userProfile = await _homeNetwork.getUserDetails();
      emit(HomeSuccess(userProfile));
    } on CustomException catch(e) {
      print(1);
      emit(HomeError(e.description));
    } catch (e) {
      print(2);
      emit(HomeError(e.toString()));
    }
  }
}
