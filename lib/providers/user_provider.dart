import 'package:chat_c6/database/database_utils.dart';
import 'package:chat_c6/models/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{
 late MyUser myUser;
 late User firebaseUser;

  UserProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser!;
    initMyUser();
  }

  initMyUser() async {
    if (firebaseUser != null) {
      myUser = await DataBaseUtils.readUserFromDB(firebaseUser.uid ?? '');
    }
  }
}
