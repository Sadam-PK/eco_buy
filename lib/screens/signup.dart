import 'package:eco_buy/utils/styles.dart';
import 'package:eco_buy/widgets/ecoButton.dart';
import 'package:eco_buy/widgets/ecoTextField.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Welcome\nPlease Register",
                    style: EcoStyle.boldStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 200.0,
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
                        EcoButton(
                          title: "SIGNUP",
                          isLoginButton: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              EcoButton(
                title: "LOGIN",
                isLoginButton: false,
                onPress: (){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
