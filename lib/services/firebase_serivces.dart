import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  static Future<String?> createAccount(String email, String password) async {
    try {
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "ERROR_EMAIL_ALREADY_IN_USE") {
        return "Email already in use";
      } if (e.code == "ERROR_WEAK_PASSWORD") {
        return "Password is too weak";
      }
      return e.message;
    } catch(e){
      return e.toString();
    }
  }
}
