import 'package:chat_c6/base.dart';
import 'package:chat_c6/database/database_utils.dart';
import 'package:chat_c6/modules/home/home_screen.dart';
import 'package:chat_c6/modules/register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/errors.dart';

class LoginViewModel extends BaseViewModel {
  void login({
    required String email,
    required String password,
  }) async {
    navigator?.showLoading();
    String? message = null;

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
  var user= await   DataBaseUtils.readUserFromDB(credential.user?.uid ?? "");
      navigator?.hideLoading();

      navigator?.showMessagesSuccess("Scusses",HomeScreen.routeName,user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      navigator?.hideLoading();
      if (message != null) {
        navigator?.showMessages(message);
      }
    } catch (e) {
      print(e);
    }
  }
}
