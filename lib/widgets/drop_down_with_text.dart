import 'package:flutter/material.dart';

class DropdownWithText extends StatelessWidget {
  final String selectedValue;
  final List<String> options;
  final String labelText;
  final Function(String?) onChanged; // Change parameter type here

  const DropdownWithText({
    required this.selectedValue,
    required this.options,
    required this.labelText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .55,
          height: MediaQuery.of(context).size.height * .05,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF34B89B)),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DropdownButton<String>(
            value: selectedValue,
            onChanged: onChanged,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '$labelText: $selectedValue',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*.03),
      ],
    );
  }
}
