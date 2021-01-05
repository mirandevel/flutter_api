class Person {
  final String name;
  final String direction;
  final int phone;
  final String email;
  final String password;
  final String profile_photo_path;

  Person(
      {this.name,
      this.direction,
      this.phone,
      this.email,
      this.password,
      this.profile_photo_path});

  Map<String, dynamic> toJson() => {
        'name': name,
        'direction': direction,
        'phone': phone,
        'email': email,
        'password': password,
        'profile_photo_path': profile_photo_path,
      };
  factory Person.fromJson(Map<String, dynamic> map) => Person(
      name: map["name"],
      direction: map["direction"],
      phone: map["phone"],
      email: map["email"],
      profile_photo_path: map["profile_photo_path"]);
}
