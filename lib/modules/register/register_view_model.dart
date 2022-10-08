import 'package:chat_c6/base.dart';
import 'package:chat_c6/core/errors.dart';
import 'package:chat_c6/database/database_utils.dart';
import 'package:chat_c6/models/my_user.dart';
import 'package:chat_c6/modules/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterViewModel extends BaseViewModel {
  String? fname = null;
  FirebaseAuth auth = FirebaseAuth.instance;

  void createUser({
    required String email,
    required String password,
    required String Fname,
   required String fName,
   required String lName,
   required String username,
  }) async {
    navigator?.showLoading();
    String? message = null;
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
      //     .then((value) {
      //   fname = Fname;
      //   auth.currentUser!.updateDisplayName(Fname);
      // })
      ;
      MyUser user = MyUser(id: credential.user?.uid ?? "", fName: fName, lName: lName, username: username, email: email);
      DataBaseUtils.createDBUser(user);

      navigator?.hideLoading();
      navigator?.showMessagesSuccess("Scusses",LoginScreen.routeName,user);
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErorrs.week) {
        message = 'The password provided is too weak.';
      } else if (e.code == FirebaseErorrs.alreadyUse) {
        message = 'The account already exists for that email.';
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
