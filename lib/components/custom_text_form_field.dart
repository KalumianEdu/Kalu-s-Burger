import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController customController;
  final int customLength;
  final RegExp customPattern;

  final String customHint;
  const CustomTextFormField({
    super.key,
    required this.customHint,
    required this.customController,
    required this.customLength,
    required this.customPattern,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: customController,
      inputFormatters: [FilteringTextInputFormatter.allow(customPattern)],
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),

      maxLength: customLength,

      decoration: InputDecoration(
        counterText: "",
        hint: Text(customHint),

        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 1.7),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1.7,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
