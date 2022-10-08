import 'package:chat_c6/base.dart';
import 'package:chat_c6/core/app_color.dart';
import 'package:chat_c6/core/constant.dart';
import 'package:chat_c6/modules/login/login_screen.dart';
import 'package:chat_c6/modules/register/navigator.dart';
import 'package:chat_c6/modules/register/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String rootName = "register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState
    extends BaseState<RegisterViewModel, RegisterScreen> implements RegisterNavigator{
  @override
  GlobalKey<FormState> KeyForm = GlobalKey<FormState>();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator=this;
  }


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (c) => viewModel,
      child: Stack(
        children: [
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: KeyForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: AppControllers.firstNameController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter your first name';
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "First Name",
                        ),

                      ),
                      TextFormField(
                        controller: AppControllers.lastNameController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter your Last name';
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "Last Name",
                        ),
                      ),
                      TextFormField(
                        controller: AppControllers.userNameController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter your Username';
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "Username",
                        ),
                      ),
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
                        decoration: const InputDecoration(
                          labelText: "Password",
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          CreateAccount();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Create Account"),
                              Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end
                        ,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, LoginScreen.routeName);

                            },
                            child:const Text("I have an account !"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void CreateAccount() async {
    if (KeyForm.currentState!.validate()) {
      // create account

      viewModel.createUser(

        email: AppControllers.emailController.text,
        password: AppControllers.passwordController.text,
        Fname: AppControllers.firstNameController.text,
        fName: AppControllers.firstNameController.text,
        lName: AppControllers.lastNameController.text,
        username: AppControllers.userNameController.text,
      );
    }
  }

  @override
  RegisterViewModel initViewModel() {
    return RegisterViewModel();
  }
}
