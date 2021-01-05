import 'dart:async';
import 'dart:convert';

import 'package:register_sqlite/models/person.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

class Api {
  void insertPerson(Person person) async {
    var url = 'http://192.168.0.15:8000/api/register';
    print('Rperson: ${person.toJson()}');
    var response = await http.post(url, body: {
      'name': person.name,
      'direction': person.direction,
      'phone': person.phone.toString(),
      'email': person.email,
      'password': person.password,
      'profile_photo_path': person.profile_photo_path,
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // print(await http.read('https://example.com/foobar.txt'));
    /* String url = 'http://127.0.0.1:8000/api/login';
    print('body:' + person.toJson().toString());
    var response =
        await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');*/
  }

  void login(String email, String password) async {
    var url = 'http://192.168.0.15:8000/api/login';
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var jsonResponse = jsonDecode(response.body);
    _saveToken(jsonResponse['token']);
  }

  void getPeople() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token') ?? 0;
    var url = 'http://192.168.0.15:8000/api/user';
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $value',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  _saveToken(String token) async {
    print('token $token');
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    print('token saved $token');
  }

  _readToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token') ?? 0;
  }
}
