import 'package:chat_c6/base.dart';
import 'package:chat_c6/modules/home/home_navigator.dart';
import 'package:chat_c6/modules/home/home_view_model.dart';
import 'package:flutter/material.dart';
import '../../core/app_color.dart';
import '../../core/constant.dart';
import '../add_room/add_room_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeViewModel, HomeScreen>
    implements HomeNavigator {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
            title: const Text("Chat App"),
          ),
          body: Container(),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.pushNamed(context, AddRoom.routeName);
            },
            child:const Icon(Icons.add),
          ),
        )
      ],
    );
  }

  @override
  HomeViewModel initViewModel() {
    // TODO: implement initViewModel
    return HomeViewModel();
  }
}
