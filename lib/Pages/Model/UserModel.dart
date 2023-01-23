import 'package:flutter/material.dart';

class Users{
  String?UsersName;
  String?Age;
  String?Email;
  String?Password;
  String?Title;
  List ?Followers;
  List? Following;

  Users({
    required this.Email,
    required this.Password,
    required this.Age,
    required this.UsersName,
    required this.Title,
    required this.Followers,
    required this.Following,

});


  Map<String,dynamic> tomap(){
    return{
      'UsersName':UsersName,
      'Age':Age,
      'Email':Email,
      'Password':Password,
      'Title':Title,
      'following':[],
      'followers': [],

    };
  }
}

