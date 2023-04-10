import 'dart:ui';

import 'package:caflutterdemo/ui/pages/myapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:caflutterdemo/ui/cubit/user_cubit.dart';
import 'package:caflutterdemo/ui/cubit/auth_cubit.dart';

// import 'myapp_test.mocks.dart';
// import 'package:mocktail/mocktail.dart';

// @GenerateNiceMocks(
//   [
//     MockSpec<AuthCubit>(),
//     MockSpec<UserCubit>(),
//   ],
// )
void main() {
  // final mockAuthCubit = MockAuthCubit();
  // final mockUserCubit = MockUserCubit();

  testWidgets('Should present MyApp', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MyApp), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
    // expect(find.byType(DecorationImage), findsOneWidget);
    // expect(find.text('CA Flutter Auth'), findsOneWidget);
  });
}
