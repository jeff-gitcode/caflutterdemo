import 'package:caflutterdemo/application/interface/api/iuser_usecase.dart';
import 'package:caflutterdemo/domain/user_entity.dart';
import 'package:caflutterdemo/ui/cubit/user_cubit.dart';
import 'package:caflutterdemo/ui/cubit/user_state.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

// import 'user_cubit_test.mocks.dart';

// class MockUserCubit extends MockCubit<UserState> implements UserCubit {}
class MockIUserUseCase extends Mock implements IUserUseCase {}

// @GenerateMocks([IUserUseCase])
void main() {
  late MockIUserUseCase userUseCase;
  late UserCubit userCubit;
  final user = UserEntity(
      id: "1",
      name: "name",
      email: "email",
      phone: "phone",
      website: "website");
  final Exception tException = Exception('Failed!');

  setUpAll(() {
    userUseCase = MockIUserUseCase();
    userCubit = UserCubit(userUseCase: userUseCase);
  });

  test(
    'initial state should be empty',
    () {
      expect(userCubit.state, InitialUserState());
    },
  );

  blocTest<UserCubit, UserState>(
    'should emit [UserLoadingState, UserLoadSuccessState] when loadUsers',
    setUp: () =>
        when(() => userUseCase.getUsers()).thenAnswer((_) async => [user]),
    build: () => userCubit,
    act: (cubit) => cubit.loadUsers(),
    // wait: const Duration(milliseconds: 5000),
    expect: () => <UserState>[
      UserLoadingState(),
      UserLoadSuccessState(users: [user]),
    ],
    verify: (_) async {
      verify(() => userUseCase.getUsers()).called(1);
    },
  );

  blocTest<UserCubit, UserState>(
    'should emit [UserLoadingState, UserLoadFailureState] when loadUsers failed',
    setUp: () => when(() => userUseCase.getUsers()).thenThrow(tException),
    build: () => userCubit,
    act: (cubit) => cubit.loadUsers(),
    // wait: const Duration(milliseconds: 5000),
    expect: () => <UserState>[
      UserLoadingState(),
      UserLoadFailureState(),
    ],
    verify: (_) async {
      verify(() => userUseCase.getUsers()).called(1);
    },
  );

  blocTest<UserCubit, UserState>(
    'should emit [UserDeleteLoadingState, UserLoadSuccessState] when deleteUser',
    setUp: () => when(() => userUseCase.deleteUser(id: "1"))
        .thenAnswer((_) async => user),
    seed: () => UserLoadSuccessState(users: [user]),
    build: () => userCubit,
    act: (cubit) => cubit.deleteUser(id: "1"),
    // wait: const Duration(milliseconds: 5000),
    expect: () => <UserState>[
      UserDeleteLoadingState(id: "1"),
      UserLoadSuccessState(users: []),
    ],
    verify: (_) async {
      verify(() => userUseCase.deleteUser(id: "1")).called(1);
    },
  );

  blocTest<UserCubit, UserState>(
    'should emit [UserCreateLoadingState, UserSubmitSuccessState] when createUser',
    setUp: () => when(() => userUseCase.createUser(user: user))
        .thenAnswer((_) async => user),
    seed: () => UserLoadSuccessState(users: []),
    build: () => userCubit,
    act: (cubit) => cubit.createUser(user: user),
    // wait: const Duration(milliseconds: 5000),
    expect: () => <UserState>[
      UserCreateLoadingState(user: user),
      UserSubmitSuccessState(users: [user]),
    ],
    verify: (_) async {
      verify(() => userUseCase.createUser(user: user)).called(1);
    },
  );

  blocTest<UserCubit, UserState>(
    'should emit [UserUpdateLoadingState, UserLoadSuccessState] when updateUser',
    setUp: () => when(() => userUseCase.updateUser(user: user))
        .thenAnswer((_) async => user),
    seed: () => UserLoadSuccessState(users: [user]),
    build: () => userCubit,
    act: (cubit) => cubit.updateUser(user: user),
    // wait: const Duration(milliseconds: 5000),
    expect: () => <UserState>[
      UserUpdateLoadingState(user: user),
      UserSubmitSuccessState(users: [user]),
    ],
    verify: (_) async {
      verify(() => userUseCase.updateUser(user: user)).called(1);
    },
  );
}
