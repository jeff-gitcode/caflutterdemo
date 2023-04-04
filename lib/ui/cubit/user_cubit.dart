import 'package:bloc/bloc.dart';
import 'package:caflutterdemo/application/interface/api/iuser_usecase.dart';
import 'package:caflutterdemo/domain/user_entity.dart';
import 'package:equatable/equatable.dart';

import 'user_state.dart';

// part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final IUserUseCase userUseCase;

  UserCubit({required this.userUseCase}) : super(InitialUserState()) {
    print('UserCubit constructor');
  }

  Future<void> loadUsers() async {
    try {
      print('loadUsers');

      // if (state is UserLoadingState) return;

      final currentState = state;
      emit(UserLoadingState());

      final result = await userUseCase.getUsers();

      if (result == null) {
        emit(UserLoadFailureState());
      } else {
        emit(UserLoadSuccessState(users: result));
      }
    } catch (e) {
      print(e);
      emit(UserLoadFailureState());
    }
  }

  Future<void> deleteUser({required String id}) async {
    try {
      // if (state is UserDeleteLoadingState) return;

      final currentState = state;

      emit(UserDeleteLoadingState(id: id));

      await userUseCase.deleteUser(id: id);

      final users = currentState.users;
      users.removeWhere((element) => element.id == id);
      emit(UserLoadSuccessState(users: users));
    } catch (e) {
      print(e);
      emit(UserDeleteFailureState());
    }
  }

  Future<void> updateUser({required UserEntity user}) async {
    try {
      // if (state is UserUpdateLoadingState) return;
      final currentState = state;

      emit(UserUpdateLoadingState(user: user));

      var updateUser = await userUseCase.updateUser(user: user);

      print(currentState);

      final users = currentState.users;
      var index = users.indexWhere((element) => element.id == updateUser.id);
      users[index] = updateUser;

      // emit(UserUpdateSuccessState(users: users));
      emit(UserSubmitSuccessState(users: users));
      print(currentState);
    } catch (e) {
      print(e);
      emit(UserUpdateFailureState());
    }
  }

  Future<void> createUser({required UserEntity user}) async {
    try {
      // if (state is UserCreateLoadingState) return;
      final currentState = state;

      emit(UserCreateLoadingState(user: user));

      var newUser = await userUseCase.createUser(user: user);

      final users = currentState.users;
      users.add(newUser);

      emit(UserSubmitSuccessState(users: users));
    } catch (e) {
      print(e);
      emit(UserCreateFailureState());
    }
  }
}
