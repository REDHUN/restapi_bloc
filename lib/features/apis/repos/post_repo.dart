import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restapibloc/features/apis/models/api_data_model.dart';

class PostRepp {
  static Future<List<ApiDataModel>> fetchPost() async {
    var client = http.Client();

    List<ApiDataModel> apis = [];
    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        ApiDataModel api =
            ApiDataModel.fromMap(result[i] as Map<String, dynamic>);
        apis.add(api);
      }

      return apis;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future<bool> addPost() async {
    var client = http.Client();

    try {
      var response = await client
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
        "title": "Redhun is Flutter Student",
        "body": "Redhun watch good flutter videos",
        "userId": "34",
        "id": "35"
      });
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
