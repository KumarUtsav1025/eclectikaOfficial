import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../../Constants/strings.dart';
import '../../../Modals/errors.dart';
import '../loginNetwork.dart';


part 'loginState.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseLogin _firebaseLogin;
  LoginCubit(this._firebaseLogin) : super(LoginInitial());

  Future<void> login(
      String email, String password) async {
    try {
      emit(LoginLoading());
      User? user = await _firebaseLogin.login(emailAddress: email, password: password);
      print(user);
      S.userId=user!.uid;
      S.email =user.email!;
      emit(LoginSuccess(user));
    } on CustomException catch(e) {
      emit(LoginError(e.description));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
