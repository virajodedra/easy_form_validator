import 'package:flutter/material.dart';
import '../validators/validator.dart';

class EasyEmailField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;

  const EasyEmailField({
    super.key,
    required this.controller,
    this.label = 'Email',
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: EasyValidators.email,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: const Icon(Icons.email),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
