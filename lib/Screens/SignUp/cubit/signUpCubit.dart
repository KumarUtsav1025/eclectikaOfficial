import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../Modals/errors.dart';
import '../signUpNetwork.dart';


part 'signUpState.dart';

class SignupCubit extends Cubit<SignupState> {
  final FirebaseSignup _firebaseSignup;
  SignupCubit(this._firebaseSignup) : super(SignupInitial());
  
  @override
  Future<void> signup(
      String email, String password) async {
    try {
      emit(const SignupLoading());
      await _firebaseSignup.signUp(emailAddress: email, password: password);
      emit(const SignupSuccess());
    } on CustomException catch(e) {
      emit(SignupError(e.description));
    } catch (e) {
      print(e);
    }
  }
}
