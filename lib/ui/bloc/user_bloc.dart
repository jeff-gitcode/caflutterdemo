// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:caflutterdemo/domain/user_entity.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/cupertino.dart';

// import '../../application/interface/api/iuser_usecase.dart';

// part 'user_event.dart';
// part 'user_state.dart';

// class UserBloc extends Bloc<UserEvent, UserState> {
//   final IUserUseCase userUseCase;

//   UserBloc({required this.userUseCase}) : super(InitialUserState());

//   @override
//   UserState get initialState => InitialUserState();

//   void loadUsers() {
//     // this.dispatch(LoadUsersEvent());
//     add(LoadUsersEvent());
//   }

//   @override
//   Stream<UserState> mapEventToState(
//     UserEvent event,
//   ) async* {
//     yield UserLoadingState();
//     if (event is UserAddEvent) {
//       yield await _mapUserAddEventToState(event);
//     } else if (event is UserUpdateEvent) {
//       yield await _mapUserUpdateEventToState(event);
//     } else if (event is UserDeleteEvent) {
//       yield await _mapUserDeleteEventToState(event);
//     } else if (event is LoadUsersEvent) {
//       yield await _mapUserLoadToState(event);
//     }
//   }

//   Future<UserState> _mapUserAddEventToState(UserAddEvent event) async {
//     try {
//       await userUseCase.insertUser(event.user);
//       final result = await userUseCase.getUsers();
//       return UserLoadSuccessState(users: result);
//     } catch (e) {
//       print(e);
//       return UserLoadFailureState();
//     }
//   }

//   Future<UserState> _mapUserUpdateEventToState(UserUpdateEvent event) async {
//     try {
//       await userUseCase.updateUser(event.user);
//       final result = await userUseCase.getUsers();
//       return UserLoadSuccessState(users: result);
//     } catch (e) {
//       print(e);
//       return UserLoadFailureState();
//     }
//   }

//   Future<UserState> _mapUserDeleteEventToState(UserDeleteEvent event) async {
//     try {
//       await userUseCase.deleteUser(event.id);
//       final result = await userUseCase.getUsers();
//       return UserLoadSuccessState(users: result);
//     } catch (e) {
//       print(e);
//       return UserLoadFailureState();
//     }
//   }

//   Future<UserState> _mapUserLoadToState(LoadUsersEvent event) async {
//     try {
//       final result = await userUseCase.getUsers();
//       return UserLoadSuccessState(users: result);
//     } catch (e) {
//       print(e);
//       return UserLoadFailureState();
//     }
//   }
// }
