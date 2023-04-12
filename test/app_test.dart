// import 'package:caflutterdemo/firebase_options.dart';
// import 'package:caflutterdemo/ui/pages/myapp.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:caflutterdemo/main.dart' as app;

void main() async {
  // IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    // Widget createWidgetForTesting({Widget? child}) {
    //   return MaterialApp(home: child);
    // }

    testWidgets('should launch app', (tester) async {
      final FlutterExceptionHandler? originalOnError = FlutterError.onError;
      app.main();
      await tester.pumpAndSettle();

      // expect(find.text('Login'), findsOneWidget);

      FlutterError.onError = originalOnError;
      // WidgetsFlutterBinding.ensureInitialized();
      // await Firebase.initializeApp(
      //   options: DefaultFirebaseOptions.currentPlatform,
      // );

      // // Build our app and trigger a frame.
      // Widget w = createWidgetForTesting(child: const MyApp());
      // await tester.pumpWidget(w);
    });
  });
}
