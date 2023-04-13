import 'package:caflutterdemo/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:caflutterdemo/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end test", () {
    testWidgets("should launch app with username and password", (tester) async {
      await app.main();
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byType(TextFormField).at(0), "jefftest@fluttertest.com");
      await tester.enterText(find.byType(TextFormField).at(1), '12345678');

      await tester.tap(find.byType(ElevatedButton).at(0));

      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
