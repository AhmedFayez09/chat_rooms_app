import 'package:chat_c6/base.dart';
import 'package:chat_c6/database/database_utils.dart';
import 'package:chat_c6/modules/add_room/add_room_navigator.dart';

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator> {
  void createRoom(String title, String catId, String desc) async {
    String? message = null;
    try {
    navigator?.showLoading();
  var resilt=    await DataBaseUtils.createDBRoom(title, desc, catId);

    } catch (e) {
      message = e.toString();
    }

    navigator?.hideLoading();
    if (message != null) {
      navigator?.showMessages(message);
    }
  }
}
