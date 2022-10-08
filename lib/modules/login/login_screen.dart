import 'package:chat_c6/base.dart';
import 'package:chat_c6/modules/login/login_navigator.dart';
import 'package:chat_c6/modules/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_color.dart';
import '../../core/constant.dart';
import '../register/register.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginViewModel, LoginScreen>
    implements LoginNavigator {
  GlobalKey<FormState> KeyForm = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  bool hidepass = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        AppImageAsset.bGImage,
        width: double.infinity,
        fit: BoxFit.fill,
        height: double.infinity,
      ),
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: noColor,
        appBar: AppBar(
          backgroundColor: noColor,
          elevation: 0,
          title: const Text("Create Account"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: KeyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: AppControllers.emailController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please Enter your Email';
                    }

                    AppControllers.appEmailValid(text);

                    if (!AppControllers.appEmailValid(text)) {
                      return 'Email not valid';
                    }

                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                ),
                TextFormField(
                  obscureText: !hidepass,
                  keyboardType: TextInputType.visiblePassword,
                  controller: AppControllers.passwordController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please Enter your Password';
                    }

                    if (text.length < 6) {
                      return 'password should at least 6 char';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidepass = !hidepass;
                            });
                          },
                          icon: Icon(
                              hidepass ?


                              Icons.visibility:
                          Icons.visibility_off))),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Login(
                      password: AppControllers.passwordController.text,
                      email: AppControllers.emailController.text,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Login"),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RegisterScreen.rootName);
                      },
                      child: const Text("Don't have an account ??"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  void Login({
    required String email,
    required String password,
  }) {
    if (KeyForm.currentState?.validate() == true) {
      //please login to firebase
      viewModel.login(email: email, password: password);
    }
  }

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }
}
