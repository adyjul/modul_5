import 'dart:convert';
import 'package:http/http.dart' as http;


class Data {
  int id;
  String namaProduct;
  String deskripsi;
  String harga;
  String gambar;

  Data({this.id, this.namaProduct, this.deskripsi, this.harga, this.gambar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaProduct = json['nama_product'];
    deskripsi = json['deskripsi'];
    harga = json['harga'];
    gambar = json['gambar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_product'] = this.namaProduct;
    data['deskripsi'] = this.deskripsi;
    data['harga'] = this.harga;
    data['gambar'] = this.gambar;
    return data;
  }

  static Future<List<Data>> connectToAPI() async {
      String urlAPI = "http://127.0.0.1:8000/api/product/";
      
      //data still get 
      var jsonObject = await http.get(urlAPI);

      //assumption data succeed from http request
      var resultJson = json.decode(jsonObject.body);
     
      List<dynamic> listUser = (resultJson as Map<String,dynamic>)['data'];
      // print(listUser);
      List<Data> users = [];
      for(int i=0; i< listUser.length; i++)
      users.add(Data.fromJson(listUser[i]));

      return users;
      // List<Product> users = [];
      // for(int i=0; i< listUser.length; i++)
      // users.add(Product.createUser(listUser[i]));
}
}

