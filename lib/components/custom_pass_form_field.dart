import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPassFormField extends StatelessWidget {
  final TextEditingController customController;
  final int customLength;

  final String customHint;
  const CustomPassFormField({
    super.key,
    required this.customHint,
    required this.customController,
    required this.customLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: customController,

      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      maxLength: customLength,

      decoration: InputDecoration(
        hint: Text(customHint),
        counterText: '',

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
