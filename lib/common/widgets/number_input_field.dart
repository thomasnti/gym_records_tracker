import 'package:flutter/material.dart';

class NumberInputField extends StatelessWidget {
  final String label;
  const NumberInputField({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        )
      ],
    );
  }
}
