class AccountEntity {
  // final String id;
  // final String name;
  // final String email;
  // final String password;
  final String token;

  AccountEntity({
    // required this.id,
    // required this.name,
    // required this.email,
    // required this.password,
    required this.token,
  });

  @override
  String toString() {
    // return 'AccountEntity{id: $id, name: $name, email: $email, password: $password, token: $token}';
    return 'AccountEntity{token: $token}';
  }
}
