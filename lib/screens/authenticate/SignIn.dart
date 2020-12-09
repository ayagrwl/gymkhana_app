import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gymkhana_app/screens/authenticate/SignUp.dart';
import 'package:gymkhana_app/screens/home/Home.dart';
import 'package:gymkhana_app/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _authService = AuthService();

  String email = '', password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 80, horizontal: 30),
            child: Text(
              "SG_IITI",
              style: TextStyle(fontSize: 60, color: Colors.white),
            ),
          ), // Appname
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "Email",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "Password",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ), // inputs
          SizedBox(height: 10),
          Container(
            child: RaisedButton(
              child: Text("Login"),
              onPressed: () async {
                FocusScope.of(context).unfocus();
                // SignIn Method
                dynamic result = await _authService.signIn(email, password);
                if (result == null) {
                  setState(() {
                    error = "Server Error, please try later";
                  });
                } else {
                  if (result['error'] == 0) {
                    print(result['message']);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  } else {
                    setState(() {
                      error = result['message'];
                    });
                  }
                }
              },
            ),
          ), // login button
          SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New to App ? ",
                  style: TextStyle(
                    color: Colors.yellow.shade900,
                  ),
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    "SignUp!",
                    style: TextStyle(
                      color: Colors.blue.shade400,
                    ),
                  ),
                )
              ],
            ),
          ), // singup button
          SizedBox(height: 10),
          Text(
            error,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
