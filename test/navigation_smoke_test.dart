import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surname_mobprog/main.dart';

void main() {
  testWidgets('starts on the feed and switches between both tabs', (
    tester,
  ) async {
    await tester.pumpWidget(const MainApp());
    await tester.pumpAndSettle();
    expect(find.text('Steve Rogers'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.notifications));
    await tester.pumpAndSettle();
    expect(find.text('No notifications'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();
    expect(find.text('Steve Rogers'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
