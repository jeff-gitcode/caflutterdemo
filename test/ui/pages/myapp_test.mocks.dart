// Mocks generated by Mockito 5.4.0 from annotations
// in caflutterdemo/test/ui/myapp_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:bloc/bloc.dart' as _i8;
import 'package:caflutterdemo/application/interface/api/iauth_usecase.dart'
    as _i2;
import 'package:caflutterdemo/application/interface/api/iuser_usecase.dart'
    as _i4;
import 'package:caflutterdemo/domain/user_entity.dart' as _i10;
import 'package:caflutterdemo/ui/cubit/auth_cubit.dart' as _i6;
import 'package:caflutterdemo/ui/cubit/auth_state.dart' as _i3;
import 'package:caflutterdemo/ui/cubit/user_cubit.dart' as _i9;
import 'package:caflutterdemo/ui/cubit/user_state.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIAuthUseCase_0 extends _i1.SmartFake implements _i2.IAuthUseCase {
  _FakeIAuthUseCase_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthState_1 extends _i1.SmartFake implements _i3.AuthState {
  _FakeAuthState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIUserUseCase_2 extends _i1.SmartFake implements _i4.IUserUseCase {
  _FakeIUserUseCase_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserState_3 extends _i1.SmartFake implements _i5.UserState {
  _FakeUserState_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthCubit extends _i1.Mock implements _i6.AuthCubit {
  @override
  _i2.IAuthUseCase get authUseCase => (super.noSuchMethod(
        Invocation.getter(#authUseCase),
        returnValue: _FakeIAuthUseCase_0(
          this,
          Invocation.getter(#authUseCase),
        ),
        returnValueForMissingStub: _FakeIAuthUseCase_0(
          this,
          Invocation.getter(#authUseCase),
        ),
      ) as _i2.IAuthUseCase);
  @override
  _i3.AuthState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAuthState_1(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeAuthState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.AuthState);
  @override
  _i7.Stream<_i3.AuthState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i7.Stream<_i3.AuthState>.empty(),
        returnValueForMissingStub: _i7.Stream<_i3.AuthState>.empty(),
      ) as _i7.Stream<_i3.AuthState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void login({
    required String? email,
    required String? password,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #login,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  void register({
    required String? name,
    required String? email,
    required String? password,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #register,
          [],
          {
            #name: name,
            #email: email,
            #password: password,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i3.AuthState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onChange(_i8.Change<_i3.AuthState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}

/// A class which mocks [UserCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserCubit extends _i1.Mock implements _i9.UserCubit {
  @override
  _i4.IUserUseCase get userUseCase => (super.noSuchMethod(
        Invocation.getter(#userUseCase),
        returnValue: _FakeIUserUseCase_2(
          this,
          Invocation.getter(#userUseCase),
        ),
        returnValueForMissingStub: _FakeIUserUseCase_2(
          this,
          Invocation.getter(#userUseCase),
        ),
      ) as _i4.IUserUseCase);
  @override
  _i5.UserState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeUserState_3(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeUserState_3(
          this,
          Invocation.getter(#state),
        ),
      ) as _i5.UserState);
  @override
  _i7.Stream<_i5.UserState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i7.Stream<_i5.UserState>.empty(),
        returnValueForMissingStub: _i7.Stream<_i5.UserState>.empty(),
      ) as _i7.Stream<_i5.UserState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i7.Future<void> loadUsers() => (super.noSuchMethod(
        Invocation.method(
          #loadUsers,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> deleteUser({required String? id}) => (super.noSuchMethod(
        Invocation.method(
          #deleteUser,
          [],
          {#id: id},
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> updateUser({required _i10.UserEntity? user}) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUser,
          [],
          {#user: user},
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> createUser({required _i10.UserEntity? user}) =>
      (super.noSuchMethod(
        Invocation.method(
          #createUser,
          [],
          {#user: user},
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  void emit(_i5.UserState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onChange(_i8.Change<_i5.UserState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}