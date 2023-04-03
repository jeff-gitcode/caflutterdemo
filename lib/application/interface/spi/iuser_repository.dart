import 'package:caflutterdemo/domain/user_entity.dart';

abstract class IUserRepository {
  Future<List<UserEntity>> getUsers();
  Future<UserEntity> getUserById({required String id});
  Future<UserEntity> createUser({required UserEntity user});
  Future<UserEntity> updateUser({required UserEntity user});
  Future<void> deleteUser({required String id});
}
