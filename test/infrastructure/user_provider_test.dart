import 'dart:convert';

import 'package:caflutterdemo/domain/user_entity.dart';
import 'package:caflutterdemo/infrastructure/db/user_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient client;
  final user = UserEntity(
      id: "1",
      name: "name",
      email: "email",
      phone: "phone",
      website: "website");

  setUpAll(() {
    client = MockClient();
  });

  test('should return result when getUserById', () async {
    when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')))
        .thenAnswer((_) async => http.Response(jsonEncode(user), 200));

    final userProvider = UserProvider(httpClient: client);

    expect(await userProvider.getUserById('1'), isA<UserEntity>());
  });

  test('should return result when getUsers', () async {
    when(client.get(Uri.parse(
            'https://jsonplaceholder.typicode.com/users?_start=0&_limit=3')))
        .thenAnswer((_) async => http.Response(jsonEncode([user]), 200));

    final userProvider = UserProvider(httpClient: client);

    expect(await userProvider.getUsers(), isA<List<UserEntity>>());
  });

  test('should return result when createUser', () async {
    when(client.post(Uri.parse('https://jsonplaceholder.typicode.com/users'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(user.toJson())))
        .thenAnswer((_) async => http.Response(jsonEncode(user), 201));

    final userProvider = UserProvider(httpClient: client);

    expect(await userProvider.createUser(user), isA<UserEntity>());
  });

  test('should return result when updateUser', () async {
    when(client.put(Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(user.toJson())))
        .thenAnswer((_) async => http.Response(jsonEncode(user), 200));

    final userProvider = UserProvider(httpClient: client);

    expect(await userProvider.updateUser(user), isA<UserEntity>());
  });

  // test('should return result when deleteUser', () async {
  //   when(client
  //           .delete(Uri.parse('https://jsonplaceholder.typicode.com/users/1')))
  //       .thenAnswer((_) async => http.Response("", 200));

  //   final userProvider = UserProvider(httpClient: client);

  //   verify(await userProvider.deleteUser('1')).called(1);
  // });
}
