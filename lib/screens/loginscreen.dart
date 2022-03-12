import 'package:eco_buy/screens/homeScreen.dart';
import 'package:eco_buy/screens/signup.dart';
import 'package:eco_buy/utils/styles.dart';
import 'package:eco_buy/widgets/ecoButton.dart';
import 'package:eco_buy/widgets/ecoTextField.dart';
import 'package:flutter/material.dart';

import '../services/firebase_serivces.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final formkey = GlobalKey<FormState>();
  bool formStateLoading = false;
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  //--------------- ECO Screen ----------------------

  Future<void> ecoDialogue(String error) async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(title: Text(error), actions: [
            EcoButton(
                title: 'Close',
                onPress: () {
                  Navigator.pop(context);
                })
          ]);
        });
  }

  //----------- submit -----------------
  submit() async {
    if (formkey.currentState!.validate()) {
      //ecoDialogue("Password Matched!");
      setState(() {
        formStateLoading = true;
      });
      String? accountStatus = await FirebaseServices.signInAccount(
          emailController!.text, passwordController!.text);
      if (accountStatus != null) {
        setState(() {
          ecoDialogue(accountStatus);
          formStateLoading = false;
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      }
    }
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
                      key: formkey,
                      child: Column(
                        children: [
                          EcoTextField(
                            controller: emailController,
                            hintText: "Enter Email",
                            validate: (v) {
                              if (v!.isEmpty) {
                                return "Bad Email";
                              }
                              return null;
                            },
                          ),
                          EcoTextField(
                            controller: passwordController,
                            hintText: "Enter Password",
                            validate: (v) {
                              if (v!.isEmpty) {
                                return "Bad Email";
                              }
                              return null;
                            },
                          ),
                          EcoButton(
                            isLoading: formStateLoading,
                            title: "LOGIN",
                            isLoginButton: true,
                            onPress: () {
                              submit();
                            },
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
