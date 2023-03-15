import 'package:caflutterdemo/domain/user_entity.dart';

import 'interface/api/iuser_usecase.dart';
import 'interface/spi/iuser_repository.dart';

class UserUseCase implements IUserUseCase {
  final IUserRepository userRepository;

  UserUseCase({required this.userRepository});

  @override
  Future<List<UserEntity>> getUsers() async {
    return await userRepository.getUsers();
  }

  @override
  Future<void> deleteUser(String id) async {
    // TODO: implement deleteUser
    return await userRepository.deleteUser(id);
  }

  @override
  Future<UserEntity> getUserById({required String id}) async {
    // TODO: implement getUserById
    return await userRepository.getUserById(id: id);
  }

  @override
  Future<UserEntity> createUser(UserEntity user) async {
    // TODO: implement insertUser
    return await userRepository.createUser(user);
  }

  @override
  Future<UserEntity> updateUser(UserEntity user) async {
    // TODO: implement updateUser
    return await userRepository.updateUser(user);
  }
}
