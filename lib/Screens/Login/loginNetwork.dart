import 'package:firebase_auth/firebase_auth.dart';

import '../../Constants/strings.dart';
import '../../Modals/errors.dart';

class FirebaseLogin {

  Future<User?> login({required String emailAddress, required String password}) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      print(userCredential.user);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw CustomException(S.firebaseErrors[e.code]!);
    }
    catch (e){
      throw CustomException(e.toString());
    }
  }
}
