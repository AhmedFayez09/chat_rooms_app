import 'package:flutter/material.dart';

class AppImageAsset{

  static const String rootImage= "assets/images";
  static const String bGImage= "$rootImage/main_bg.png";


}
class AppControllers{
  static  var firstNameController= TextEditingController();
  static  var lastNameController= TextEditingController();
  static  var userNameController= TextEditingController();
  static  var passwordController= TextEditingController();
  static  var emailController= TextEditingController();
  static var nameRoomController = TextEditingController();
  static var descRoomController = TextEditingController();



















static  bool appEmailValid(text){
     return  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
 }


}