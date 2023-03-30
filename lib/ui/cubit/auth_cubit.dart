import 'package:bloc/bloc.dart';

import '../../application/interface/api/iauth_usecase.dart' show IAuthUseCase;
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthUseCase authUseCase;

  AuthCubit({required this.authUseCase}) : super(AuthInitial());

  void login({required String email, required String password}) async {
    try {
      if (state is AuthLoadingState) return;

      final currentState = state;

      final result = await authUseCase.login(email, password);

      if (result == null) {
        emit(AuthFailureState());
      } else {
        emit(AuthSuccessState(user: result));
      }
    } catch (e) {
      print(e);
      emit(AuthFailureState());
    }
  }

  void register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      if (state is AuthLoadingState) return;

      final currentState = state;

      final result = await authUseCase.register(name, email, password);

      if (result == null) {
        emit(AuthFailureState());
      } else {
        emit(AuthSuccessState(user: result));
      }
    } catch (e) {
      print(e);
      emit(AuthFailureState());
    }
  }
}
