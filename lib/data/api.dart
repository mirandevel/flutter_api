import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:register_sqlite/models/person.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Api {
  void insertPerson(Person person) async {
    var url = 'http://192.168.0.13:8000/api/register';
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

  Future<bool> login(String email, String password) async {
    var url = 'http://192.168.0.13:8000/api/login';
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var jsonResponse = jsonDecode(response.body);
    return _saveToken(jsonResponse['token']);
  }

  Future<List<Person>> getPeople() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token') ?? 0;
    print('RToken read: $value');
    var url = 'http://192.168.0.13:8000/api/user';
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $value',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var jsonResponse = jsonDecode(response.body);
    Person person = Person.fromJson(jsonResponse);
    List<Person> people = [];
    people.add(person);
    return people;
  }

  Future<bool> _saveToken(String token) async {
    print('token $token');
    try {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      print('token saved $token');
    } catch (e) {
      return false;
    }
  }

  _readToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token') ?? 0;
  }
}
