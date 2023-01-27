import 'dart:convert';
import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {

  String email;
  String userId;
  String name;
  String contactNumber;

  UserProfile({
    required this.userId,
    required this.name,
    required this.contactNumber,
    required this.email,
  });

  UserProfile.fromJson(Map<String, dynamic> json):
        userId=json['userid'],
        name = json['name'],
        email = json['email'],
        contactNumber=json['contactNumber']
  ;

  factory UserProfile.fromFirestore(Map<String, dynamic> data) {
    return UserProfile(
      name: data['name'],
      userId: data['userId'],
      contactNumber: data['contactNumber'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toJson() => {
    'userId':userId,
    'name': name,
    'email': email,
    'contactNumber':contactNumber,
  };

  @override
  List<Object?> get props => [email];
}