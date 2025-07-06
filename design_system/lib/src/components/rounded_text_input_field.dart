import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/colors.dart';

class RoundedTextInputField extends StatelessWidget {
  const RoundedTextInputField({
    required this.labelText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.textAlign = TextAlign.center,
    this.textCapitalization = TextCapitalization.sentences,
    this.enabled = true,
    super.key,
  });

  final String labelText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Center(
          child: Text(labelText),
        ),
        fillColor: TokioMarineColors.backgroundColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        labelStyle: const TextStyle(color: TokioMarineColors.gray),
        floatingLabelAlignment: FloatingLabelAlignment.center,
      ),
      style: const TextStyle(
        color: TokioMarineColors.white,
      ),
      obscureText: obscureText,
      validator: validator,
      textAlign: textAlign,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      enabled: enabled,
      inputFormatters: inputFormatters,
    );
  }
}
