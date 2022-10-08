import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat_c6/core/constant.dart';
import 'package:chat_c6/database/database_utils.dart';
import 'package:chat_c6/models/my_user.dart';
import 'package:chat_c6/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseViewModel<S extends BaseNavigator> extends ChangeNotifier {
  S? navigator = null;
}

abstract class BaseNavigator {
  
  void hideLoading();
  void showLoading();
  void showMessages(String message);
  void showMessagesSuccess(String message, String pageName, MyUser user);
}

abstract class BaseState<VM extends BaseViewModel, T extends StatefulWidget>
    extends State<T> implements BaseNavigator {
  late VM viewModel;

  VM initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void showLoading() {
    Size size = MediaQuery.of(context).size;
    showDialog(
        context: context,
        builder: (c) {
          return Center(
            child: Container(
              color: Colors.white,
              width: size.width * 0.75,
              height: 130,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Looding...',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        SizedBox(width: 10),
                        CircularProgressIndicator(),
                        SizedBox(width: 15),
                        Text("Please Wait",
                            style: TextStyle(fontSize: 20, color: Colors.black))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  void showMessages(String message) {
    Size size = MediaQuery.of(context).size;

    // AlertDialog(title: Center(child:Text(message),),);
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: 'Worring...',
      desc: message,
      buttonsTextStyle: const TextStyle(color: Colors.black),
      showCloseIcon: true,
      btnOkOnPress: () {
        AppControllers.emailController.clear();
        AppControllers.passwordController.clear();
      },
      btnOkColor: Color(0xFF3598DB),
    ).show();
  }

  @override
  void showMessagesSuccess(String message, String pageName, MyUser user) async {
    var provider = Provider.of<UserProvider>(context);
    provider.myUser = user;
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: 'Done',
      desc: message,
      buttonsTextStyle: const TextStyle(color: Colors.black),
      showCloseIcon: true,
      btnOkOnPress: () {
        Navigator.pushReplacementNamed(context, pageName);
      },
      btnOkColor: Color(0xFF3598DB),
    ).show();
  }
}
