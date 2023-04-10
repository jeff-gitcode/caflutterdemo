import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:caflutterdemo/domain/user_entity.dart';
import 'package:caflutterdemo/ui/cubit/auth_state.dart';
import 'package:caflutterdemo/ui/pages/home.dart';
import 'package:caflutterdemo/ui/pages/login.dart';
import 'package:caflutterdemo/ui/pages/myapp.dart';
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

  setUpAll(() {
    registerFallbackValue(MockAuthState());
  });

  setUp(() {});

  testWidgets('Should present Login', (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    when(() => mockAuthCubit.state).thenReturn(AuthSuccessState(user: user));

    await tester.pumpWidget(Builder(builder: (BuildContext context) {
      return MaterialApp(
          title: "test",
          theme: null,
          home: Container(
            decoration: null,
            child: BlocProvider<AuthCubit>.value(
              value: mockAuthCubit,
              child: LoginPage(),
            ),
          ));
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
          home: Container(
            decoration: null,
            child: BlocProvider<AuthCubit>.value(
              value: mockAuthCubit,
              child: LoginPage(),
            ),
          ));
    }));
    expect(find.byType(LoginPage), findsOneWidget);

    // verify(mockObserver.didPush(any(), any()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
