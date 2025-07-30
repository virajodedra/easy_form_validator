import 'package:flutter/material.dart';
import '../widgets/easy_email_field.dart';
import '../widgets/easy_password_field.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_validx Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_validx Example')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                EasyEmailField(controller: TextEditingController()),
                const SizedBox(height: 20),
                EasyPasswordField(controller: TextEditingController()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
