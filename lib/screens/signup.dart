import 'package:eco_buy/utils/styles.dart';
import 'package:eco_buy/widgets/ecoButton.dart';
import 'package:eco_buy/widgets/ecoTextField.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? retypePasswordController = TextEditingController();
  String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
              width: double.infinity,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome\nPlease Register",
                    style: EcoStyle.boldStyle,
                    textAlign: TextAlign.center,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Form(
                          child: Column(
                            children: [
                              EcoTextField(
                                hintText: "Enter Email",
                                controller: emailController,
                              ),
                              EcoTextField(
                                hintText: "Enter Password",
                                controller: passwordController,
                                isPassword: true,
                              ),
                              EcoTextField(
                                hintText: "Confirm Password",
                                controller: retypePasswordController,
                                isPassword: true,
                              ),
                              EcoButton(
                                title: "SIGNUP",
                                isLoginButton: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  EcoButton(
                    title: "GOTO LOGIN",
                    isLoginButton: false,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
      ),
      );
  }
}
