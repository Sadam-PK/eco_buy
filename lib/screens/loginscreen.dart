import 'package:eco_buy/utils/styles.dart';
import 'package:eco_buy/widgets/ecoTextField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Welcome, Please login.",
                  style: EcoStyle.boldStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    EcoTextField(
                      hintText: "Enter Email",
                    ),
                    EcoTextField(
                      hintText: "Enter Password",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
