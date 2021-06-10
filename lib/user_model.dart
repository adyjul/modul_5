import 'dart:convert';
import 'package:http/http.dart' as http;

class User{
  String nama;
  String harga;

  User({this.nama, this.harga});

  //mapping data json 
  factory User.createUser(Map <String,dynamic> object){
      return User(
        nama : object['nama_product'],
        harga : object['harga']
      );      
  }

  //connect to API
   static Future<List<User>> connectToAPI() async {
      String urlAPI = "http://127.0.0.1:8000/api/product/";
      
      //data still get 
      var jsonObject = await http.get(urlAPI);

      //assumption data succeed from http request
      var resultJson = json.decode(jsonObject.body);
      
      List<dynamic> listUser = (jsonObject as Map<String,dynamic>)['data'];

      List<User> users = [];
      for(int i=0; i< listUser.length; i++)
      users.add(User.createUser(listUser[i]));

      //data is object of object therefore data on parsing
      // var userData = (resultJson as Map<String,dynamic>)['data'];
      // print(userData);
      //parsing data in method above
      return users;

   }  
}