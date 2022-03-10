import 'package:flutter/material.dart';

class EcoTextField extends StatefulWidget {
  String? hintText;
  TextEditingController? controller;
  String? Function(String?)? validate;
  bool isPassword;
  IconData? icon;
  bool check;

  EcoTextField(
      {this.hintText,
      this.controller,
      this.validate,
      this.isPassword = false,
      this.icon,
      this.check = false});

  @override
  State<EcoTextField> createState() => _EcoTextFieldState();
}

class _EcoTextFieldState extends State<EcoTextField> {
  List<bool> isp = [false, true, true];

  Icon iconChecker() {
    if (widget.isPassword == true) {
      return Icon(Icons.visibility);
    } else if (widget.isPassword == false && widget.hintText == "Enter Email") {
      return Icon(Icons.email);
    } else if (widget.isPassword == false) {
      return Icon(Icons.visibility_off);
    } else {
      return Icon(Icons.circle);
    }
  }

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
        controller: widget.controller,
        validator: widget.validate,
        obscureText: widget.isPassword == false ? false : widget.isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText ?? 'hintText...',
          contentPadding: const EdgeInsets.all(10),
          suffixIcon: IconButton(
            onPressed: () {
              if (widget.isPassword == false) {
                setState(() {
                  widget.isPassword = true;
                });
              } else {
                setState(() {
                  widget.isPassword = false;
                });
              }
            },
            icon: iconChecker(),
          ),
        ),
      ),
    );
  }
}
