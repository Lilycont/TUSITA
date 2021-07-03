import 'dart:convert';

import 'package:hcl_zgaf_tdmi_final/src/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:io';

class UserProvider {
  final String _url = 'pv0o5o5psl.execute-api.us-east-2.amazonaws.com';

  Future<bool> crearUsuario(UserModel user) async {
    final url = Uri.https(_url, '/prod/api/signup');

    final resp = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: userModelToJson(user));

    print(userModelToJson(user));
    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;
  }

  Future<bool> buscarUsuario(UserModel user) async {
    final url = Uri.https(_url, '/prod/api/login');

    final resp = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: userModelToJson(user));

    final decodeData = json.decode(resp.body);
    var res;
    try {
      print(decodeData[0][0]['res']);
      res = true;
    } catch (e) {
      res = false;
    }
    return res;
  }
}
