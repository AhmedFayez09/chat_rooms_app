import 'package:chat_c6/models/rooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/my_user.dart';

class DataBaseUtils {

  static CollectionReference<MyUser> getCollectionUser() {
    return firestore.collection(MyUser.CollectionName).withConverter<MyUser>(
          fromFirestore: (snapshot, _) => MyUser.fromJson(snapshot.data()!),
          toFirestore: (user, _op) => user.toJson(),
        );
  }

  static CollectionReference<Rooms> getCollectionRoom() {
    return firestore.collection(Rooms.CollectRoomName).withConverter<Rooms>(
      fromFirestore: (snapshot, _) => Rooms.formJson(snapshot.data()!),
      toFirestore: (room, _op) => room.toJson(),
    );
  }


  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static void createDBUser(MyUser user) async {
    await getCollectionUser().doc(user.id).set(user);
  }

  static Future<void> createDBRoom(String title,String desc,String catID)async{
  var roomdata =  await getCollectionRoom().doc();
  var room = Rooms(id: roomdata.id, title: title, desc: desc, catID: catID);
  roomdata.set(room);
  }

  static Future<MyUser> readUserFromDB(String id) async {
    var userData = await getCollectionUser().doc(id).get();
    return userData.data()!;
  }
}
