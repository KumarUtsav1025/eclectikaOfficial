import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eclectika23_official_app/Modals/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Constants/strings.dart';
import '../../Modals/errors.dart';

class FirebaseSignup {
  Future<User?> signUp({required String emailAddress, required String password}) async {
    try {
      final userCredential =await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      throw CustomException(S.firebaseErrors[e.code]!);
    }catch (e){
      throw CustomException('Something Went Wrong');
    }
  }

  Future<void> addUser({required UserProfile userProfile}) async {
    final CollectionReference userRef = FirebaseFirestore.instance.collection('users');
    Map<String, dynamic> userData = userProfile.toJson();
    print(userProfile.name);
    try{
      await userRef.doc(userProfile.userId.toString()).set(userData).then((_){
        print('Added');
      });
    }
    catch (e){
      print(e.toString());
      throw CustomException('Something Went Wrong');
    }
  }
}
