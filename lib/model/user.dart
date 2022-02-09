class User {
  final String name;
  final String age;

  User({required this.age, required this.name});

  factory User.fromMap(Map<String, dynamic> user) {
    return User(age: user["age"]!.toString(), name: user['name']!);
  }

  Map<String, String> tomap(User user) {
    return {"name": user.name, "age": user.age};
  }
}
