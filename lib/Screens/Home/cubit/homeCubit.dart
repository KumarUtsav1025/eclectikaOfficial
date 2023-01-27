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

  Future<void> sendSMS(
      String msg, List<String> listReceipents, List<String> data) async {
    try {
      emit(HomeLoading());
      emit(SMSSuccess("hello"));
    } on CustomException catch(e) {
      print(3);
      emit(HomeError(e.description));
    } catch (e) {
      print(4);
      emit(HomeError(e.toString()));
    }
  }

  Future<void> getUser() async {
    try {
      emit(HomeLoading());
      UserProfile userProfile = await _homeNetwork.getUserDetails() as UserProfile;
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
