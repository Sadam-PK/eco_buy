import 'package:eco_buy/screens/loginscreen.dart';
import 'package:eco_buy/services/firebase_serivces.dart';
import 'package:eco_buy/utils/styles.dart';
import 'package:eco_buy/widgets/ecoButton.dart';
import 'package:eco_buy/widgets/ecoTextField.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? retypePasswordController = TextEditingController();
  String? Function(String?)? validate;
  bool ispassword = true;
  bool ispasswordConfirm = true;
  FocusNode? passwordFocus;
  FocusNode? passwordFocusconfirm;
  final formkey = GlobalKey<FormState>();
  bool formStateLoading = false;

  @override
  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    retypePasswordController?.dispose();
    super.dispose();
  }

  Future<void> ecoDialogue(String error) async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              title: Text(error),
              actions: [
                EcoButton(
                    title: 'Close',
                    onPress: () {
                      Navigator.pop(context);
                    })
              ]);
        }
    );
  }

  submit() async {
    if (formkey.currentState!.validate()) {
      if (passwordController!.text == retypePasswordController!.text) {
        //ecoDialogue("Password Matched!");
        setState(() {
          formStateLoading = true;
        });
        String? accountStatus = await FirebaseServices.createAccount(
            emailController!.text, passwordController!.text);
        if(accountStatus != null){
          setState(() {
            formStateLoading = false;
          });
        }else{
          Navigator.pop(context);
        }
        //
        // Navigator.push(
        //   context, MaterialPageRoute(builder: (_) => LoginScreen()),
        // );
      }
    }
  }

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
                SizedBox(
                  height: 100,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            EcoTextField(
                              hintText: "Enter Email",
                              controller: emailController,
                              check: true,
                              isPassword: ispassword,
                              icon: Icon(Icons.email),
                              inputAction: TextInputAction.next,
                              validate: (v) {
                                if (v!.isEmpty ||
                                    !v.contains("@") ||
                                    !v.contains(".com")) {
                                  return "email is badly formated..";
                                }
                                return null;
                              },
                            ),
                            EcoTextField(
                              hintText: "Enter Password",
                              controller: passwordController,
                              isPassword: ispassword,
                              inputAction: TextInputAction.next,
                              focusNode: passwordFocus,
                              validate: (v) {
                                if (v!.isEmpty) {
                                  return "password shouldn't be empty";
                                }
                                return null;
                              },
                              icon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    ispassword = !ispassword;
                                  });
                                },
                                icon: ispassword
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                              ),
                            ),
                            EcoTextField(
                              hintText: "Confirm Password",
                              controller: retypePasswordController,
                              isPassword: ispasswordConfirm,
                              inputAction: TextInputAction.next,
                              focusNode: passwordFocusconfirm,
                              validate: (v) {
                                if (v!.isEmpty) {
                                  return "password shouldn't be empty";
                                }
                                return null;
                              },
                              icon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    ispasswordConfirm = !ispasswordConfirm;
                                  });
                                },
                                icon: ispasswordConfirm
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                              ),
                            ),
                            EcoButton(
                              title: "SIGNUP",
                              isLoginButton: false,
                              onPress: () {
                                submit();
                              },
                              isLoading: formStateLoading,
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
