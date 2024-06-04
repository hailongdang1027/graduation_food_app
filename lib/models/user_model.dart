class UserModel {
  String? userid;
  String? email;
  String? name;
  String? phone;

  UserModel({this.userid, this.email, this.name, this.phone});

  factory UserModel.fromMap(map){
    return UserModel(
      email: map['email'],
      userid: map['userid'],
      name: map['name'],
      phone: map['phone'],
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'email': email,
      'userid': userid,
      'name': name,
      'phone': phone,
    };
  }
}