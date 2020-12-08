class Person {
  final int id;
  final String name;
  final String direction;
  final int phone;

  Person({this.id, this.name, this.direction, this.phone});

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'direction': direction,
        'phone': phone,
      };
  factory Person.fromMap(Map<String, dynamic> map) => Person(
      id: map["id"],
      name: map["name"],
      direction: map["direction"],
      phone: map["phone"]);
}
