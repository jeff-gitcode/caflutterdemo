import 'package:caflutterdemo/ui/pages/myapp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    Widget createWidgetForTesting({Widget? child}) {
      return MaterialApp(home: child);
    }

    testWidgets('should launch app', (tester) async {
      // app.main();
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      // Build our app and trigger a frame.
      Widget w = createWidgetForTesting(child: const MyApp());
      await tester.pumpWidget(w);
    });
  });
}
