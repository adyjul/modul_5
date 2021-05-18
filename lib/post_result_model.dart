import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String nama;
  String id;
  String job;
  String create;

  PostResult({this.nama, this.id, this.job, this.create});

//for mapping json
  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
        nama: object['name'],
        id: object['id'],
        job: object['job'],
        create: object['createdAt']);
  }

//for post data API
  static Future<PostResult> connectToAPI(String nama, String job) async {
    String apiURL = 'https://reqres.in/api/users';

    var jsonResult = await http.post(apiURL, body: {
      'name': nama,
      'job': job,
    });

    var jsonObject = json.decode(jsonResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}
