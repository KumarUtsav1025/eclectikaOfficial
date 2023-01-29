import 'package:bloc/bloc.dart';
import 'package:eclectika23_official_app/Modals/users.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../Modals/errors.dart';
import '../signUpNetwork.dart';


part 'signUpState.dart';

class SignupCubit extends Cubit<SignupState> {
  final FirebaseSignup _firebaseSignup;
  SignupCubit(this._firebaseSignup) : super(SignupInitial());
  
  @override
  Future<void> signup(
      String email, String password, String name, String phoneNumber) async {
    try {
      emit(const SignupLoading());
      User? userCredential = await _firebaseSignup.signUp(emailAddress: email, password: password);
      print(userCredential);
      await _firebaseSignup.addUser(userProfile: UserProfile(userId: userCredential!.uid, name: name, contactNumber: phoneNumber, email: email));
      emit(const SignupSuccess());
    } on CustomException catch(e) {
      emit(SignupError(e.description));
    } catch (e) {
      print(e);
    }
  }
}
