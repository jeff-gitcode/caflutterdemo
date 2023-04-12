import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:caflutterdemo/domain/user_entity.dart';
import 'package:caflutterdemo/ui/cubit/auth_state.dart';
import 'package:caflutterdemo/ui/pages/home.dart';
import 'package:caflutterdemo/ui/pages/login.dart';
import 'package:caflutterdemo/ui/pages/myapp.dart';
import 'package:caflutterdemo/ui/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:caflutterdemo/ui/cubit/user_cubit.dart';
import 'package:caflutterdemo/ui/cubit/auth_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

class MockAuthState extends Fake implements AuthState {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final mockAuthCubit = MockAuthCubit();
  // final mockUserCubit = MockUserCubit();
  final user = MockUser(
    isAnonymous: false,
    uid: '123',
    email: 'test',
    displayName: 'test',
    photoURL: 'test',
    phoneNumber: 'test',
    providerData: [],
    // metadata: MockUserMetadata(creationTime: DateTime.now()),
  );
  MockNavigatorObserver mockNavigatorObserver;

  tearDown(() {
    // mockAuthCubit.clear(),
    // mockNavigatorObserver.clear(),
    // mockUserCubit.close(),
  });

  setUpAll(() {
    registerFallbackValue(MockAuthState());
    mockNavigatorObserver = MockNavigatorObserver();
  });

  setUp(() {
    when(() => mockAuthCubit.login(email: 'email', password: 'password'))
        .thenAnswer((_) async => user);
  });

  testWidgets('Should present Login', (WidgetTester tester) async {
    // final mockObserver = MockNavigatorObserver();
    when(() => mockAuthCubit.state).thenReturn(AuthSuccessState(user: user));

    await tester.pumpWidget(Builder(builder: (BuildContext context) {
      return MaterialApp(
          // navigatorObservers: [mockNavigatorObserver],
          title: "test",
          theme: null,
          home: Scaffold(
              body: Container(
            decoration: null,
            child: BlocProvider<AuthCubit>.value(
              value: mockAuthCubit,
              child: LoginPage(),
            ),
          )));
    }));
    expect(find.byType(LoginPage), findsOneWidget);

    // verify(mockObserver.didPush(any(), any()));

    expect(find.text('login page'), findsOneWidget);
  });

  testWidgets('Should load when AuthLoadingState', (WidgetTester tester) async {
    when(() => mockAuthCubit.state).thenReturn(AuthLoadingState());

    await tester.pumpWidget(Builder(builder: (BuildContext context) {
      return MaterialApp(
          title: "test",
          theme: null,
          home: Scaffold(
              body: Container(
            decoration: null,
            child: BlocProvider<AuthCubit>.value(
              value: mockAuthCubit,
              child: LoginPage(),
            ),
          )));
    }));
    expect(find.byType(LoginPage), findsOneWidget);

    // verify(mockObserver.didPush(any(), any()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Should show login form when click on login',
      (WidgetTester tester) async {
    when(() => mockAuthCubit.state).thenReturn(AuthInitial());

    await tester.pumpWidget(Builder(builder: (BuildContext context) {
      return MaterialApp(
          home: Scaffold(
              body: Container(
        decoration: null,
        child: BlocProvider<AuthCubit>.value(
          value: mockAuthCubit,
          child: LoginPage(),
        ),
      )));
    }));
    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).at(0), 'email');
    await tester.enterText(find.byType(TextFormField).at(1), 'password');
    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pump();

    verify(() => mockAuthCubit.login(email: 'email', password: 'password'))
        .called(1);
    // expect(find.text('Password'), findsOneWidget);
  });

  testWidgets('Should show register form when click on register',
      (WidgetTester tester) async {
    when(() => mockAuthCubit.state).thenReturn(AuthInitial());

    await tester.pumpWidget(Builder(builder: (BuildContext context) {
      return MaterialApp(
          home: Scaffold(
              body: Container(
        decoration: null,
        child: BlocProvider<AuthCubit>.value(
          value: mockAuthCubit,
          child: LoginPage(),
        ),
      )));
    }));
    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);

    final button = find.widgetWithText(ElevatedButton, 'Register');
    // await tester.ensureVisible(button);
    await tester.tap(button);
    // await tester.pump();

    // expect(find.byType(RegisterPage), findsOneWidget);
    // expect(find.text('Register'), findsOneWidget);
    // await tester.tap(find.byType(ElevatedButton).at(1));
    // await tester.pump();

    // expect(find.byType(RegisterPage), findsOneWidget);
  });
}
