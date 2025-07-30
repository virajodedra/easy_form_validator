import 'package:flutter/material.dart';
import '../validators/validator.dart';

/// A pre-styled `TextFormField` for validating email input.
///
/// It comes with built-in email validation and customizable [hintText].
class EasyEmailField extends StatelessWidget {
  /// Controller for managing the input text.
  final TextEditingController controller;

  /// Placeholder text shown in the input field.
  final String hintText;

  /// Creates an [EasyEmailField] widget.
  ///
  /// [controller] is required.
  /// [hintText] defaults to 'Email' if not provided.
  const EasyEmailField({
    super.key,
    required this.controller,
    this.hintText = 'Email',
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: Validator.email(),
      decoration: InputDecoration(
        labelText: hintText,
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
