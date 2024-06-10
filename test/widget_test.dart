// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:at10dance_flutter/main.dart';

void main() {
  testWidgets('App Shell has a menu', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that we have a drawer and assign it to a var
    final drawer = find.byIcon(Icons.menu);
    expect(drawer, findsOneWidget);

    // Open the drawer
    await tester.tap(drawer);

    await tester.pumpAndSettle();

    // Verify that we have a drawer with our menu items
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.list), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);
  });

  // Test that we can navigate to the Roster Screen
  testWidgets('Can navigate to Roster Screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that we have a drawer and assign it to a var
    final drawer = find.byIcon(Icons.menu);
    expect(drawer, findsOneWidget);

    // Open the drawer
    await tester.tap(drawer);

    await tester.pumpAndSettle();

    // Tap on the Roster menu item
    await tester.tap(find.byIcon(Icons.list));

    await tester.pumpAndSettle();

    // Verify that we are on the Roster Screen
    expect(find.text('Roster'), findsOneWidget);
  });
}
