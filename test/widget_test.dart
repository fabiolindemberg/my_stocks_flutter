// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_stocks/features/onboarding/onBoarding.dart';

void main() {

  testWidgets(
        'Navigate to second and back to first page',
        (WidgetTester tester) async {
      var onboardingPage = OnBoarding();

      await tester.pumpWidget(MaterialApp(home: onboardingPage));
      expect(find.text("Itau"), findsOneWidget);

      var element = find.byKey(Key("onboarding"));
      await tester.drag(element, Offset(-500, 0));
      await tester.pump();

      expect(find.text("Petrobras"), findsOneWidget);

      await tester.drag(element, Offset(500, 0));
      await tester.pump();

      expect(find.text("Itau"), findsOneWidget);
    });

    testWidgets('Reaches the last page',
        (WidgetTester tester) async {
      var onboardingPage = OnBoarding();
      await tester.pumpWidget(MaterialApp(home: onboardingPage));

      var element = find.byKey(Key("onboarding"));

      await tester.drag(element, Offset(-500, 0));
      await tester.pumpAndSettle();

      await tester.drag(element, Offset(-500, 0));
      await tester.pumpAndSettle();

      expect(find.byType(RaisedButton), findsOneWidget);
    });

    testWidgets("Navigate to main screen, them check it's title",
        (WidgetTester tester) async {
      var onboardingPage = OnBoarding();
      await tester.pumpWidget(MaterialApp(home: onboardingPage));

      var element = find.byKey(Key("onboarding"));

      await tester.drag(element, Offset(-500, 0));
      await tester.pumpAndSettle();

      await tester.drag(element, Offset(-500, 0));
      await tester.pumpAndSettle();

      var button = find.byType(RaisedButton);
      await tester.tap(button);
      await tester.pumpAndSettle();

      expect(find.text('Ativos'), findsOneWidget);
    });

    testWidgets("Navigate to Stock form, them check it's title",
        (WidgetTester tester) async {
      var onboardingPage = OnBoarding();
      await tester.pumpWidget(MaterialApp(home: onboardingPage));

      var element = find.byKey(Key("onboarding"));

      await tester.drag(element, Offset(-500, 0));
      await tester.pumpAndSettle();

      await tester.drag(element, Offset(-500, 0));
      await tester.pumpAndSettle();

      var button = find.byType(RaisedButton);
      await tester.tap(button);
      await tester.pumpAndSettle();

      var element2 = find.byIcon(Icons.plus_one);
      await tester.tap(element2);
      await tester.pumpAndSettle();
      expect(find.text('Ativo'), findsOneWidget);
    });
}


