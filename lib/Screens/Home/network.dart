import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../Modals/errors.dart';
import '../../Modals/users.dart';

class HomeNetwork{

  Future<UserProfile> getUserDetails() async{
    final docRef = FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid);
    return await docRef.get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data);
        return UserProfile.fromFirestore(data);
      },
      onError: (e){
        print("Error getting document: $e");
        throw CustomException(e.toString());
      },
    );
  }

  Future<void> updateData({required List<String> data}) async {
    final docRef = FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid);
    try{
      await docRef.update({'locationTimestamp':data})
          .then((_){
        print('Added');
      });
    }
    catch (e){
      throw CustomException('Something Went Wrong');
    }
  }

}