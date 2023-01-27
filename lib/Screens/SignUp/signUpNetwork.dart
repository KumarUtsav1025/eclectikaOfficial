import 'package:firebase_auth/firebase_auth.dart';
import '../../Constants/strings.dart';
import '../../Modals/errors.dart';

class FirebaseSignup {
  Future<void> signUp({required String emailAddress, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      throw CustomException(S.firebaseErrors[e.code]!);
    }catch (e){
      print(e);
    }
  }
}
