import 'package:flutter/material.dart';
import 'package:register_sqlite/data/api.dart';
import 'package:register_sqlite/models/person.dart';
import 'package:register_sqlite/views/home_page.dart';

import 'register_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  // MyDatabase _myDatabase = MyDatabase();
  var email = "", password = "";

  final TextEditingController t4 = new TextEditingController(text: "");
  final TextEditingController t5 = new TextEditingController(text: "");

  void save() async {
    setState(() {
      email = t4.text;
      password = t5.text;

      //_myDatabase.insertPerson(person);
      Api _api = new Api();
      Future<bool> sw = _api.login(email, password);

      sw.then((bool value) => home()).catchError((e) => 499);
      clear();
    });
  }

  void clear() {
    t4.text = "";
    t5.text = "";
  }

  void home() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  void initState() {
    //  _myDatabase
    //      .initialize()
    //      .then((value) => 'FFFFFFFFF..................database intialize');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F9),
      body: SingleChildScrollView(
        child: new Container(
          padding: EdgeInsets.only(left: 20, top: 30, right: 20),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/person.png'),
              new TextField(
                controller: t4,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'email',
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              new TextField(
                controller: t5,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'password',
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 20),
              new MaterialButton(
                height: 58,
                minWidth: 200,
                child: new Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)),
                color: Colors.white,
                elevation: 10.0,
                onPressed: save,
              ),
              SizedBox(height: 20),
              new MaterialButton(
                height: 58,
                minWidth: 200,
                child: new Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)),
                color: Colors.white,
                elevation: 10.0,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
