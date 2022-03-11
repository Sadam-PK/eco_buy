import 'package:flutter/material.dart';

class EcoTextField extends StatefulWidget {
  String? hintText;
  TextEditingController? controller;
  String? Function(String?)? validate;
  bool isPassword;
  Widget? icon;
  bool check;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;

  EcoTextField({
    this.hintText,
    this.controller,
    this.validate,
    this.isPassword = false,
    this.icon,
    this.check = false,
    this.inputAction,
    this.focusNode,
  });

  @override
  State<EcoTextField> createState() => _EcoTextFieldState();
}

class _EcoTextFieldState extends State<EcoTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 7,
      ),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        focusNode: widget.focusNode,
        textInputAction: widget.inputAction,
        controller: widget.controller,
        validator: widget.validate,
        obscureText: widget.isPassword == false ? false : widget.isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText ?? 'hintText...',
          contentPadding: const EdgeInsets.all(10),
          suffixIcon: widget.icon,
        ),
      ),
    );
  }
}
