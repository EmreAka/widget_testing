import 'package:flutter/material.dart';
import 'package:widget_testing/services/mock_service.dart';
import 'package:widget_testing/views/widget_test_01.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Testing',
      home: WidgetTest01(
        mockService: MockService(),
      ),
    );
  }
}
