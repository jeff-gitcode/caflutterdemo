import 'package:caflutterdemo/application/user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:caflutterdemo/domain/user_entity.dart';
import 'package:caflutterdemo/application/interface/spi/iuser_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import './user_usecase_test.mocks.dart';

// class MockUserRepository extends Mock implements IUserRepository {}

// @GenerateMocks([
//   IUserRepository
// ], customMocks: [
//   MockSpec<IUserRepository>(
//       as: #MockUserRepository, returnNullOnMissingStub: true)
// ])

@GenerateMocks([IUserRepository])
void main() {
  late MockIUserRepository repo;
  final user = UserEntity(
      id: "1",
      name: "name",
      email: "email",
      phone: "phone",
      website: "website");

  group("User UseCase", () {
    setUpAll(() {
      repo = MockIUserRepository();
    });

    test("should return a list of users", () async {
      when(repo.getUsers()).thenAnswer((_) async => [user]);
      // when(userRepository.getUsers()).thenReturn(new Future(() => [user]));

      final userUseCase = UserUseCase(userRepository: repo);
      final users = await userUseCase.getUsers();
      expect(users, isA<List<UserEntity>>());
    });

    test("should return a user by id", () async {
      when(repo.getUserById(id: "1")).thenAnswer((_) async => user);

      final userUseCase = UserUseCase(userRepository: repo);
      final userById = await userUseCase.getUserById(id: "1");
      expect(userById, isA<UserEntity>());
    });

    test("should create user", () async {
      when(repo.createUser(user: user)).thenAnswer((_) async => user);

      final userUseCase = UserUseCase(userRepository: repo);
      final userCreated = await userUseCase.createUser(user: user);
      expect(userCreated, isA<UserEntity>());
    });

    test("should update user", () async {
      when(repo.updateUser(user: user)).thenAnswer((_) async => user);

      final userUseCase = UserUseCase(userRepository: repo);
      final userUpdated = await userUseCase.updateUser(user: user);
      expect(userUpdated, isA<UserEntity>());
    });

    test("should delete user", () async {
      when(repo.deleteUser(id: "1")).thenAnswer((_) async => user);

      final userUseCase = UserUseCase(userRepository: repo);
      await userUseCase.deleteUser(id: "1");
      verify(repo.deleteUser(id: "1")).called(1);
    });
  });
}
