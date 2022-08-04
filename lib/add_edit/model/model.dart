class UserData {
  String? id;
  final String? name;
  final String? age;
  UserData({this.age, this.id, this.name});

  Map<String, dynamic> toJson() => {
        'id': id,
        'age': age,
        'name': name,
      };
}
