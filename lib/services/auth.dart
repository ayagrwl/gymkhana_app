import 'package:firebase_auth/firebase_auth.dart' as Auth;

class AuthService {
  final Auth.FirebaseAuth _auth = Auth.FirebaseAuth.instance;

  Future signIn(String email, String passwd) async {
    try {
      Auth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: passwd);

      if (!result.user.emailVerified) {
        result.user.sendEmailVerification();
        _auth.signOut();
        return {
          "error": 1,
          "message": "Please confirm your email",
        };
      } else {
        return {
          "error": 0,
          "message": "Login Success!",
        };
      }
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future signUp(String email, String passwd) async {
    try {
      Auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: passwd);
      return result.user;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
    } catch (err) {
      print(err);
    }

    if (_auth.currentUser == null) {
      return true;
    } else {
      return false;
    }
  }
}
