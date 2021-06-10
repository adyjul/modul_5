import 'package:belajar/collection_user.dart';
import 'package:belajar/post_result_model.dart';
import 'package:belajar/user_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final String url = "http://127.0.0.1:8000/api/product/";

  Future getProduct() async {
    var response = await http.get(Uri.parse(url));
    print(jsonDecode(response.body));
    return json.decode(response.body);
  }
 
  @override
  Widget build(BuildContext context) {
    getProduct();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('Belajar modul5'))),
        body: FutureBuilder(
          future: getProduct(),
          builder: (_,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount : snapshot.data['data'].length,
                  itemBuilder: (_,index){
                   return Container(
                        height: 180,
                        child: Card(
                          elevation: 5,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: EdgeInsets.all(5),
                                  height: 120,
                                  width: 120,
                                  child: Image.network(
                                    snapshot.data['data'][index]['gambar'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          snapshot.data['data'][index]
                                              ['nama_product'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(snapshot.data['data'][index]
                                          ['deskripsi']),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.attach_money),
                                          Text(snapshot.data['data'][index]
                                              ['harga']),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                });
                }else{
                  return Text('erro');
                }
              }
          ,
          )
      ),
    );
  }
}
