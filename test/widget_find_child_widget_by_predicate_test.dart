import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:widget_testing/services/mock_service.dart';
import 'package:widget_testing/views/widget_test_01.dart';
import 'package:widget_testing/views/widget_test_02.dart';

class MockServiceMock extends Mock implements MockService {}

void main() {
  late MockService mockService;

  setUp(() {
    mockService = MockServiceMock();
    log("setUp");
  });

  testWidgets('Should send method called once when form is valid',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: WidgetTest02(
        mockService: mockService,
      ),
    ));

    final nameField = find.byWidgetPredicate((widget) =>
        widget is TextField &&
        widget.decoration!.labelText == "Enter your name");

    final passwordField = find.byWidgetPredicate((widget) =>
        widget is TextField &&
        widget.decoration!.labelText == "Enter your password");

    final sendButton = find.byWidgetPredicate((widget) =>
        widget is ElevatedButton &&
        widget.child is Text &&
        (widget.child as Text).data == "Send");

    await tester.enterText(nameField, "John Doe");
    await tester.enterText(passwordField, "12345678910");

    await tester.tap(sendButton);

    await tester.pump();

    verify(
      () => mockService.send("John Doe", "12345678910"),
    ).called(1);
  });

  testWidgets('Should not method called once when form is not valid',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: WidgetTest01(
        mockService: mockService,
      ),
    ));

    final nameField = find.byWidgetPredicate((widget) =>
        widget is TextField &&
        widget.decoration!.labelText == "Enter your name");

    final passwordField = find.byWidgetPredicate((widget) =>
        widget is TextField &&
        widget.decoration!.labelText == "Enter your password");

    final sendButton = find.byWidgetPredicate((widget) =>
        widget is ElevatedButton &&
        widget.child is Text &&
        (widget.child as Text).data == "Send");

    await tester.enterText(nameField, "Jo");
    await tester.enterText(passwordField, "12");

    await tester.tap(sendButton);

    await tester.pump();

    verifyNever(
      () => mockService.send(any(), any()),
    ).called(0);
  });
}
