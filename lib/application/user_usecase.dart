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
  Future<void> deleteUser({required String id}) async {
    // TODO: implement deleteUser
    return await userRepository.deleteUser(id: id);
  }

  @override
  Future<UserEntity> getUserById({required String id}) async {
    // TODO: implement getUserById
    return await userRepository.getUserById(id: id);
  }

  @override
  Future<UserEntity> createUser({required UserEntity user}) async {
    // TODO: implement insertUser
    return await userRepository.createUser(user: user);
  }

  @override
  Future<UserEntity> updateUser({required UserEntity user}) async {
    // TODO: implement updateUser
    return await userRepository.updateUser(user: user);
  }
}
