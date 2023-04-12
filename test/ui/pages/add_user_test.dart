import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:caflutterdemo/domain/user_entity.dart';
import 'package:caflutterdemo/ui/cubit/auth_state.dart';
import 'package:caflutterdemo/ui/cubit/user_state.dart';
import 'package:caflutterdemo/ui/pages/add_user.dart';
import 'package:caflutterdemo/ui/pages/home.dart';
import 'package:caflutterdemo/ui/pages/login.dart';
import 'package:caflutterdemo/ui/pages/myapp.dart';
import 'package:caflutterdemo/ui/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:caflutterdemo/ui/cubit/user_cubit.dart';
import 'package:caflutterdemo/ui/cubit/auth_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockUserCubit extends MockCubit<UserState> implements UserCubit {}

class MockUserState extends Fake implements UserState {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final mockUserCubit = MockUserCubit();
  // final mockUserCubit = MockUserCubit();
  final user = UserEntity(
      id: "1",
      name: "name",
      email: "email",
      phone: "phone",
      website: "website");
  MockNavigatorObserver mockNavigatorObserver;

  tearDown(() {
    // mockAuthCubit.clear(),
    // mockNavigatorObserver.clear(),
    // mockUserCubit.close(),
  });

  setUpAll(() {
    registerFallbackValue(MockUserState());
    mockNavigatorObserver = MockNavigatorObserver();
    GetIt.instance.registerFactory<UserCubit>(() => mockUserCubit);
  });

  setUp(() {
    // when(() => mockUserCubit.updateUser(user: user))
    //     .thenAnswer((_) async => user);

    // when(() => mockUserCubit.createUser(user: user));
  });

  testWidgets('Should present CreateUser', (WidgetTester tester) async {
    // final mockObserver = MockNavigatorObserver();
    when(() => mockUserCubit.state).thenReturn(InitialUserState());

    await tester.pumpWidget(Builder(builder: (BuildContext context) {
      return MaterialApp(
          home: Scaffold(
              body: Container(
        decoration: null,
        child: BlocProvider<UserCubit>.value(
          value: mockUserCubit,
          child: CreateUser(user: user, edit: true),
        ),
      )));
    }));

    expect(find.byType(CreateUser), findsOneWidget);
  });
}
