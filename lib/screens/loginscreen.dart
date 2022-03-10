import 'package:eco_buy/screens/signup.dart';
import 'package:eco_buy/utils/styles.dart';
import 'package:eco_buy/widgets/ecoButton.dart';
import 'package:eco_buy/widgets/ecoTextField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Welcome\nPlease Login",
                      style: EcoStyle.boldStyle,
                      textAlign: TextAlign.center,
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
                            title: "LOGIN",
                            isLoginButton: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                EcoButton(
                  title: "CREATE ACCOUNT",
                  isLoginButton: false,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SignUpScreen(),
                      ),
                    );
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
