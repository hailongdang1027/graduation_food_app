class ProfileModel {
  String? name;
  String? phone;

  ProfileModel({this.name, this.phone});

  toJson(){
    return{ "Name": name, "Phone": phone};
  }
  
  ProfileModel.fromJson(Map<String,dynamic> json){
    phone = json['phone'];
    name = json['name'];
  }
}