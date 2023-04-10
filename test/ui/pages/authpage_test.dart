import 'package:caflutterdemo/ui/pages/auth_page.dart';
import 'package:caflutterdemo/ui/pages/login.dart';
import 'package:caflutterdemo/ui/pages/myapp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:caflutterdemo/ui/cubit/user_cubit.dart';
import 'package:caflutterdemo/ui/cubit/auth_cubit.dart';

import '../firebase_mock.dart';
import 'myapp_test.mocks.dart';
// import 'package:mocktail/mocktail.dart';

@GenerateNiceMocks(
  [
    MockSpec<AuthCubit>(),
    MockSpec<UserCubit>(),
  ],
)
void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  setupFirebaseAuthMocks();

  final mockAuthCubit = MockAuthCubit();
  final mockUserCubit = MockUserCubit();
  // Initialize App
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('Should present AuthPage', (WidgetTester tester) async {
    await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>.value(value: mockAuthCubit),
          BlocProvider<UserCubit>.value(value: mockUserCubit),
        ],
        child: MaterialApp(
            title: "test",
            theme: null,
            home: Container(
              decoration: null,
              child: AuthPage(),
            ))));

    await tester.pumpAndSettle();

    expect(find.byType(AuthPage), findsOneWidget);
    // expect(find.text("CA Flutter Auth"), findsOneWidget);
    // expect(find.byType(AppBar), findsOneWidget);
    // expect(find.byType(Center), findsOneWidget);
  });

  // testWidgets('Should present AuthPage whene firebase initialze',
  //     (WidgetTester tester) async {
  //   // setupFirebaseAuthMocks();
  //   // await Firebase.initializeApp();

  //   await tester.pumpWidget(
  //     MultiBlocProvider(
  //       providers: [
  //         BlocProvider<AuthCubit>.value(value: mockAuthCubit),
  //         BlocProvider<UserCubit>.value(value: mockUserCubit),
  //       ],
  //       child: const MaterialApp(
  //         home: AuthPage(),
  //       ),
  //     ),
  //   );
  //   expect(find.byType(AuthPage), findsOneWidget);
  //   expect(find.text("CA Flutter Auth"), findsOneWidget);
  //   expect(find.byType(AppBar), findsOneWidget);
  //   expect(find.byType(LoginPage), findsOneWidget);
  // });
}
