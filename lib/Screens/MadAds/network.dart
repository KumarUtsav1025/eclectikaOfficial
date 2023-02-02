import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';


import '../../Modals/errors.dart';
import '../../Modals/users.dart';

class MadAdsNetwork{

  Future<List<String>> getVideoLinks() async{
    final docRef = FirebaseFirestore.instance.collection("MadAdsLinks").doc("videoLinks");
    List<String> videoLinks = [];
    return await docRef.get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, String>;
        print(data);
        data.forEach((k,v) => videoLinks.add(v));
        return videoLinks;
      },
      onError: (e){
        print("Error getting document: $e");
        throw CustomException(e.toString());
      },
    );
  }


}