class MyUser {
  static const String CollectionName = 'User';
  String id;
  String fName;
  String lName;
  String username;
  String email;

  MyUser({
    required this.id,
    required this.fName,
    required this.lName,
    required this.username,
    required this.email,
  });

  MyUser.fromJson(Map<String, dynamic> json)
      : this(
      id: json['id'],
      fName: json['fName'],
      lName: json['lName'],
      username: json['username'],
      email: json['email']
  );

  Map<String,dynamic>  toJson() {
    return {
      'id':id,
      'fName':fName,
      'lName':lName,
      'username':username,
      'email':email
    };
  }





























}
