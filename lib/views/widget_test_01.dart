import 'package:flutter/material.dart';
import 'package:widget_testing/services/mock_service.dart';

class WidgetTest01 extends StatefulWidget {
  final MockService mockService;

  const WidgetTest01({super.key, required this.mockService});

  @override
  State<WidgetTest01> createState() => _WidgetTest01State();
}

class _WidgetTest01State extends State<WidgetTest01> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void send() {
    if (_nameController.text.isNotEmpty &&
        _passwordController.text.length > 9) {
      widget.mockService.send(_nameController.text, _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Widget Test 01'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  key: const ValueKey("nameField"),
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Enter your name',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  key: const ValueKey("passwordField"),
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Enter your password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  key: const ValueKey("sendButton"),
                  onPressed: send,
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
        ));
  }
}
