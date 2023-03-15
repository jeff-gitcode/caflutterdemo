import 'package:caflutterdemo/domain/user_entity.dart';
import 'package:caflutterdemo/infrastructure/db/user_provider.dart';

import '../../application/interface/spi/iuser_repository.dart';

class UserRepository implements IUserRepository {
  final UserProvider userProvider;

  UserRepository({required this.userProvider});

  Future<UserEntity> getUserById({required String id}) async {
    return await userProvider.getUserById(id);
  }

  Future<UserEntity> createUser(UserEntity user) async {
    return await userProvider.createUser(user);
  }

  Future<UserEntity> updateUser(UserEntity user) async {
    return await userProvider.updateUser(user);
  }

  Future<void> deleteUser(String id) async {
    await userProvider.deleteUser(id);
  }

  Future<List<UserEntity>> getUsers() async {
    return await userProvider.getUsers();
  }
}
