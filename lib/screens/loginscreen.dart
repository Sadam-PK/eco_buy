import 'package:eco_buy/screens/signup.dart';
import 'package:eco_buy/utils/styles.dart';
import 'package:eco_buy/widgets/ecoButton.dart';
import 'package:eco_buy/widgets/ecoTextField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
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
                    SizedBox(
                      height: 100,
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
                  height: 150,
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
