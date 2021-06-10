import 'dart:convert';
import 'package:http/http.dart' as http;

class UserData{
  String id;
  String name;
  String email;
  String avatar;

  UserData({this.id, this.name, this.email, this.avatar});

  //mapping data from json
  factory UserData.createUserData(Map <String,dynamic> object){
      return UserData(
        id : object['id'].toString(),
        name : object['first_name']+" "+object['last_name'],
        email : object['email'],
        avatar : object['avatar']
      );
  }

  static Future <List<UserData>> connectToAPI(String id) async {
    String urlAPI = "https://reqres.in/api/users?page="+id;

    var jsonObject = await http.get(urlAPI);

    var resultJSON = json.decode(jsonObject.body); 
    List<dynamic> user = (resultJSON as Map <String,dynamic>)['data'];

    List<UserData> users = [];
    for(int i = 0; i<user.length;i++)
    users.add(UserData.createUserData(user[i]));
    return users;
  } 
}