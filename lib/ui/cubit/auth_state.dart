import 'package:equatable/equatable.dart' show Equatable;
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  // final User? user;

  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final User user;

  const AuthSuccessState({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthFailureState extends AuthState {}
