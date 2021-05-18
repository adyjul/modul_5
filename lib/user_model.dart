import 'dart:convert';
import 'package:http/http.dart' as http;

class User{
  String email;
  String name;

  User({this.email, this.name});

  //mapping data json 
  factory User.createUser(Map <String,dynamic> object){
      return User(
        email : object['email'],
        name : object['first_name'] + object['last_name']
      );      
  }

  //connect to API
   static Future<User> connectToAPI(String id) async {
      String urlAPI = "https://reqres.in/api/users/"+id;
      
      //data still get 
      var jsonObject = await http.get(urlAPI);

      //assumption data succeed from http request
      var resultJson = json.decode(jsonObject.body);

      //data is object of object therefore data on parsing
      var userData = (resultJson as Map<String,dynamic>)['data'];
      
      //parsing data in method above
      return User.createUser(userData);

   }  
}