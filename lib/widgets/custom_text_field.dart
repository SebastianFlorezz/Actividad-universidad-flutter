import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
    this.keyboardType,
    this.prefixText,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final String? prefixText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      textCapitalization: keyboardType == null
          ? TextCapitalization.words
          : TextCapitalization.none,
      decoration: InputDecoration(
        labelText: label,
        prefixText: prefixText,
      ),
    );
  }
}