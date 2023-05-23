import 'dart:convert';

import 'package:json_api/model/userModel.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String url = 'https://reqres.in/api/users?page=2';
  Future<UserModel?> fectUsers() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(res.body));
    } else {
      print('İstek Başarısız... ${res.statusCode}');
    }
  }
}
