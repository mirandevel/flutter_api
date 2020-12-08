import 'package:flutter/material.dart';
import 'package:register_sqlite/data/my_database.dart';
import 'package:register_sqlite/models/person.dart';

class ShowPage extends StatefulWidget {
  ShowPage({Key key}) : super(key: key);

  @override
  State createState() => ShowPageState();
}

class ShowPageState extends State<ShowPage> {
  MyDatabase _myDatabase = MyDatabase();
  Future<List<Person>> _people;
  @override
  void initState() {
    _myDatabase.initialize().then((value) => 'database intialize');
    _people = _myDatabase.getPeople();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F9),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: FutureBuilder<List>(
            future: _people,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    if (index <= snapshot.data.length - 1)
                      return Card(
                        elevation: 10,
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Text(snapshot.data[index].name,
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.blue)),
                                  new Text(
                                      'Direction: ' +
                                          snapshot.data[index].direction,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey[700])),
                                  new Text(
                                      'Phone: ' +
                                          snapshot.data[index].phone.toString(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[700])),
                                ])),
                      );
                  },
                );
              }
              return Text('Loading...', style: TextStyle(color: Colors.blue));
            }),
      ),
    );
  }
}
