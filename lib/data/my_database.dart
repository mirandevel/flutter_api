import 'dart:async';

import 'package:register_sqlite/models/person.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  /*static Database _database;
  static MyDatabase _myDB;
  MyDatabase._createInstance();
  factory MyDatabase() {
    if (_myDB == null) {
      _myDB = MyDatabase._createInstance();
      print('database initialize.....');
    }
    return _myDB;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initialize();
    }
    return _database;
  }

  Future<Database> initialize() async {
    var dir = await getDatabasesPath();
    var path = dir + "people.db";
    var database =
        await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE person (id INTEGER PRIMARY KEY, name TEXT not null, direction TEXT not null,phone INTEGER not null)');
    });
    return database;
  }

  void insertPerson(Person person) async {
    var db = await this.database;
    var result = await db.insert('person', person.toMap());
    print('result: $result');
  }

  Future<List<Person>> getPeople() async {
    List<Person> people = [];
    var db = await this.database;
    var result = await db.query('person');
    result.forEach((element) {
      var person = Person.fromMap(element);
      people.add(person);
    });
    return people;
  }*/
}
