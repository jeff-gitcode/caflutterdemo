import 'dart:convert';
import 'package:http/http.dart';

import '../../domain/user_entity.dart';

abstract class IUserProvider {
  Future<UserEntity> getUserById(String id);
  Future<List<UserEntity>> getUsers();
  Future<UserEntity> createUser(UserEntity user);
  Future<UserEntity> updateUser(UserEntity user);
  Future<void> deleteUser(String id);
}

class UserProvider implements IUserProvider {
  final Client httpClient;

  UserProvider({required this.httpClient});

  Future<UserEntity> getUserById(String id) async {
    final response = await httpClient
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'));
    if (response.statusCode == 200) {
      return UserEntity.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<List<UserEntity>> getUsers() async {
    final response = await httpClient.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/users?_start=0&_limit=3'));
    if (response.statusCode == 200) {
      final users = jsonDecode(response.body) as List;
      return users.map((u) => UserEntity.fromJson(u)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<UserEntity> createUser(UserEntity user) async {
    final response = await httpClient.post(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode == 201) {
      return UserEntity.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<UserEntity> updateUser(UserEntity user) async {
    final response = await httpClient.put(
      Uri.parse('https://jsonplaceholder.typicode.com/users/${user.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode == 200) {
      return UserEntity.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(String id) async {
    final response = await httpClient
        .delete(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
}
