class Rooms {
  static const String CollectRoomName = 'roomName';
  String id;
  String title;
  String desc;
  String catID;

  Rooms({
    required this.id,
    required this.title,
    required this.desc,
    required this.catID,
  });
  Rooms.formJson(Map<String ,dynamic>json):this(
    id: json['id'],
    catID: json['catID'],
    desc: json['desc'],
    title: json['title']
  );

 Map<String ,dynamic>  toJson(){
  return {
    'id':id,
    'catID':catID,
    'desc':desc,
    'title':title
  };
}



























}
