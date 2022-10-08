import 'dart:math';

import 'package:chat_c6/base.dart';
import 'package:chat_c6/models/category.dart';
import 'package:chat_c6/modules/add_room/add_room_navigator.dart';
import 'package:chat_c6/modules/add_room/add_room_view_model.dart';
import 'package:flutter/material.dart';

import '../../core/app_color.dart';
import '../../core/constant.dart';

class AddRoom extends StatefulWidget {
  static const String routeName = 'addRoom';

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends BaseState<AddRoomViewModel, AddRoom>
    implements AddRoomNavigator {
  var Categories = Category.getCategories();
  Category? selectItem;
  GlobalKey<FormState> KeyData = GlobalKey<FormState>();

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
          body: Card(
            margin: const EdgeInsets.all(24),
            elevation: 3,
            borderOnForeground: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Form(
                key: KeyData,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const Text(
                      "Create Room",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 25),
                    Image.asset('assets/images/room_head.png'),
                    TextFormField(
                      controller: AppControllers.nameRoomController,
                      decoration: const InputDecoration(
                        labelText: "Room Name",
                      ),
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter room name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: AppControllers.descRoomController,
                      decoration: const InputDecoration(
                        labelText: "Room Desc",
                      ),
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter room description';
                        }
                        return null;
                      },
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,

                      child: DropdownButton<Category>(
                        value: selectItem,elevation: 3,hint: Text('Choose Category'),
                          isExpanded: true,
                          items: Categories.map((element) {
                            return DropdownMenuItem<Category>(
                                value: element,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(element.title),
                                    Image.asset(
                                      element.image,
                                      height: 50,
                                      width: 50,
                                    )
                                  ],
                                ));
                          }).toList(),
                          onChanged: (cat) {
                            setState(() {
                            selectItem = cat;

                            });
                          }),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        createRoom();
                      },
                      child: const Text('Create'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  void createRoom() {
    if (KeyData.currentState?.validate() == true) {
      //Create Room
      viewModel.createRoom(
          AppControllers.nameRoomController.text,
          AppControllers.nameRoomController.text,
          AppControllers.descRoomController.text);
    }
  }

  @override
  AddRoomViewModel initViewModel() {
    // TODO: implement initViewModel
    return AddRoomViewModel();
  }
}
