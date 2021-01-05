import 'package:flutter/material.dart';
import 'package:register_sqlite/views/login_page.dart';
import 'package:register_sqlite/views/register_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Register",
        theme: new ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          accentColor: Colors.blue[200],
        ),
        home: new LoginPage());
  }
}
