import 'package:chat_c6/modules/add_room/add_room_screen.dart';
import 'package:chat_c6/modules/home/home_screen.dart';
import 'package:chat_c6/modules/login/login_screen.dart';
import 'package:chat_c6/modules/register/register.dart';
import 'package:chat_c6/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UserProvider>(create: (c) => UserProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: provider.firebaseUser != null
          ? HomeScreen.routeName
          : LoginScreen.routeName,
      routes: {
        RegisterScreen.rootName: (c) => RegisterScreen(),
        LoginScreen.routeName: (c) => LoginScreen(),
        HomeScreen.routeName: (c) => HomeScreen(),
        AddRoom.routeName:(c)=>AddRoom(),
      },
    );
  }
}
