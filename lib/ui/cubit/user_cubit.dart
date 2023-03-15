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

  void loadUsers() async {
    try {
      if (state is UserLoadingState) return;

      final currentState = state;

      emit(UserLoadingState() as UserState);

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

  void deleteUser({required String id}) async {
    try {
      if (state is UserDeleteLoadingState) return;

      final currentState = state;

      emit(UserDeleteLoadingState(id: id) as UserState);

      await userUseCase.deleteUser(id);

      final users = currentState.users;
      users.removeWhere((element) => element.id == id);
      emit(UserLoadSuccessState(users: users));
    } catch (e) {
      print(e);
      emit(UserDeleteFailureState());
    }
  }

  void updateUser({required UserEntity user}) async {
    try {
      if (state is UserUpdateLoadingState) return;

      final currentState = state;

      emit(UserUpdateLoadingState(user: user) as UserState);

      var updateUser = await userUseCase.updateUser(user);

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

  void createUser({required UserEntity user}) async {
    try {
      if (state is UserCreateLoadingState) return;

      final currentState = state;

      emit(UserCreateLoadingState(user: user) as UserState);

      var newUser = await userUseCase.createUser(user);

      final users = currentState.users;
      users.add(newUser);

      emit(UserSubmitSuccessState(users: users));
    } catch (e) {
      print(e);
      emit(UserCreateFailureState());
    }
  }
}
