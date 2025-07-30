import 'package:flutter/material.dart';

import '../validators/validator.dart';

class EasyPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final int minLength;
  final String label;

  const EasyPasswordField({
    super.key,
    required this.controller,
    this.minLength = 6,
    this.label = 'Password',
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
      validator: (value) =>
          EasyValidators.password(value, minLength: widget.minLength),
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
          onPressed: () => setState(() => _obscure = !_obscure),
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
