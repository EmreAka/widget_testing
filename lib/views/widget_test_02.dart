import 'package:flutter/material.dart';
import 'package:widget_testing/services/mock_service.dart';

class WidgetTest02 extends StatefulWidget {
  final MockService mockService;

  const WidgetTest02({super.key, required this.mockService});

  @override
  State<WidgetTest02> createState() => _WidgetTest02State();
}

class _WidgetTest02State extends State<WidgetTest02> {
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
              CustomTextfield(
                controller: _nameController,
                labelText: 'Enter your name',
                obscureText: false,
              ),
              const SizedBox(height: 20),
              CustomTextfield(
                controller: _passwordController,
                labelText: 'Enter your password',
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
      ),
    );
  }
}

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      obscureText: obscureText,
    );
  }
}
