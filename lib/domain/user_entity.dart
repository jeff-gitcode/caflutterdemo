class UserEntity {
  final String id;
  String name;
  final String email;
  final String phone;
  final String website;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
  });

  @override
  String toString() {
    return 'UserEntity{id: $id, name: $name, email: $email, phone: $phone, website: $website}';
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'].toString(),
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
    );
  }

  // {fields: [{key: id, type: Input, label: ID, value: 1}, {key: name, type: Input, label: Name, placeholder: Enter Your Name, required: true, value: Leanne Grahams}, {key: email, type: Input, label:
  // Email, required: true, value: Sincere@april.biz}, {key: phone, type: Input, label: Phone, value: 1-770-736-8031 x56442}, {key: website, type: Input, label: Website, value: hildegard.org}]}
  factory UserEntity.fromForm(Map<String, dynamic> data) {
    String id = "";
    String name = "";
    String email = "";
    String phone = "";
    String website = "";

    (data["fields"] as List<dynamic>).forEach((item) => {
          if (item["key"] == "id") {id = item["value"].toString()},
          if (item["key"] == "name") {name = item["value"].toString()},
          if (item["key"] == "email") {email = item["value"].toString()},
          if (item["key"] == "phone") {phone = item["value"].toString()},
          if (item["key"] == "website") {website = item["value"].toString()}
        });

    return UserEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      website: website,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'website': website,
    };
  }
}
