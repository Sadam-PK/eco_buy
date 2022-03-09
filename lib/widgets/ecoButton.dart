import 'package:flutter/material.dart';

class EcoButton extends StatelessWidget {
  String? title;
  bool? isLoginButton;

  EcoButton({this.title, this.isLoginButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: isLoginButton == false ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isLoginButton == false ? Colors.black : Colors.black,
        ),
      ),
      child: Center(
        child: Text(
          title ?? "Button",
          style: TextStyle(
              color: isLoginButton == false ? Colors.black : Colors.white,
              fontSize: 16),
        ),
      ),
    );
  }
}
