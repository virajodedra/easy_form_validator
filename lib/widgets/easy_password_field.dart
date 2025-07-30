import 'package:flutter/material.dart';
import '../validators/validator.dart';

/// A pre-styled `TextFormField` for password input with validation.
///
/// Automatically hides the input and applies required + min length validation.
class EasyPasswordField extends StatefulWidget {
  /// Controller for managing the password input text.
  final TextEditingController controller;

  /// Placeholder text shown in the input field.
  final String hintText;

  /// Minimum required length for password. Defaults to 6.
  final int minLength;

  /// Creates an [EasyPasswordField] widget.
  ///
  /// [controller] is required.
  /// [hintText] defaults to 'Password' and [minLength] to 6 if not provided.
  const EasyPasswordField({
    super.key,
    required this.controller,
    this.hintText = 'Password',
    this.minLength = 6,
  });

  @override
  State<EasyPasswordField> createState() => _EasyPasswordFieldState();
}

class _EasyPasswordFieldState extends State<EasyPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscure,
      validator: Validator.combine([
        Validator.required(),
        Validator.minLength(widget.minLength),
      ]),
      decoration: InputDecoration(
        labelText: widget.hintText,
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
          onPressed: () => setState(() => _obscure = !_obscure),
        ),
      ),
    );
  }
}
