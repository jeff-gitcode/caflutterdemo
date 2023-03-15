import 'package:caflutterdemo/domain/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  final List<UserEntity> users;

  const UserState({this.users = const []});

  @override
  List<Object> get props => [users];
}

class InitialUserState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadSuccessState extends UserState {
  final List<UserEntity> users;

  UserLoadSuccessState({required this.users});

  @override
  List<Object> get props => [users];
}

class UserLoadFailureState extends UserState {
  @override
  List<Object> get props => [];
}

class UserSubmitSuccessState extends UserState {
  final List<UserEntity> users;

  UserSubmitSuccessState({required this.users});

  @override
  List<Object> get props => [users];
}

//Update

class UserUpdateFailureState extends UserState {
  @override
  List<Object> get props => [];
}

class UserUpdateLoadingState extends UserState {
  final UserEntity user;

  UserUpdateLoadingState({required this.user});

  @override
  List<Object> get props => [user];
}

// Create
class UserCreateFailureState extends UserState {
  @override
  List<Object> get props => [];
}

class UserCreateLoadingState extends UserState {
  final UserEntity user;

  UserCreateLoadingState({required this.user});

  @override
  List<Object> get props => [user];
}

// Delete
// class UserDeleteSuccessState extends UserState {
//   final List<UserEntity> users;

//   UserDeleteSuccessState({required this.users});

//   @override
//   List<Object> get props => [users];
// }

class UserDeleteFailureState extends UserState {
  @override
  List<Object> get props => [];
}

class UserDeleteLoadingState extends UserState {
  final String id;

  UserDeleteLoadingState({required this.id});

  @override
  List<Object> get props => [id];
}
