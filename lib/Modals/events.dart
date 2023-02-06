import 'dart:convert';
import 'package:equatable/equatable.dart';

class Events extends Equatable {

  String name;
  String desc;
  String link;
  String img;

  Events({
    required this.name,
    required this.desc,
    required this.link,
    required this.img,
  });

  Events.fromJson(List<dynamic> json):
        name = json[0],
        desc = json[1],
        link = json[2],
        img = json[3]
  ;

  factory Events.fromFirestore(List<dynamic> json) {
    return Events(
        name :json[0].toString(),
        desc : json[1].toString(),
        link : json[2].toString(),
        img : json[3].toString(),
    );
  }


  @override
  List<Object?> get props => [name];
}