import 'package:caflutterdemo/domain/user_entity.dart';

abstract class IUserRepository {
  Future<List<UserEntity>> getUsers();
  Future<UserEntity> getUserById({required String id});
  Future<UserEntity> createUser(UserEntity user);
  Future<UserEntity> updateUser(UserEntity user);
  Future<void> deleteUser(String id);
}
