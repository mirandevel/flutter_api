import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:register_sqlite/data/api.dart';

import 'package:register_sqlite/models/person.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  State createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  // MyDatabase _myDatabase = MyDatabase();
  var name = "", direction = "", phone = 0, email = "", password = "";
  File _image;
  final picker = ImagePicker();

  final TextEditingController t1 = new TextEditingController(text: "");
  final TextEditingController t2 = new TextEditingController(text: "");
  final TextEditingController t3 = new TextEditingController(text: "");
  final TextEditingController t4 = new TextEditingController(text: "");
  final TextEditingController t5 = new TextEditingController(text: "");
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void save() async {
    setState(() {
      name = t1.text;
      direction = t2.text;
      phone = int.parse(t3.text);
      email = t4.text;
      password = t5.text;

      var person = Person(
          name: name,
          direction: direction,
          phone: phone,
          email: email,
          password: password,
          profile_photo_path:
              'storage/F7blXRnxOArKymjvpeyCHh2SauBIJw0ioEYGbPtH.png');
      //_myDatabase.insertPerson(person);
      Api _api = new Api();
      _api.insertPerson(person);
      clear();
    });
  }

  void clear() {
    t1.text = "";
    t2.text = "";
    t3.text = "";
    t4.text = "";
    t5.text = "";
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
              SizedBox(height: 10),
              _image == null ? Text('No image selected.') : Image.file(_image),
              SizedBox(height: 20),
              new TextField(
                controller: t1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Name',
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
                controller: t2,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Direction',
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
              new TextField(
                controller: t3,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Phone',
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
                onPressed: save,
              ),
              SizedBox(height: 20),
              new MaterialButton(
                height: 58,
                minWidth: 200,
                child: new Text(
                  "Image",
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
                onPressed: getImage,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
