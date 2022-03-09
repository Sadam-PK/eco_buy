import 'package:flutter/material.dart';

class EcoTextField extends StatelessWidget {
  String? hintText;

  EcoTextField({this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText ?? 'hintText...',
            contentPadding: const EdgeInsets.all(10)),
      ),
    );
  }
}
