import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gymkhana_app/screens/authenticate/SignIn.dart';
import 'package:gymkhana_app/services/auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthService _authService = AuthService();
  String uname = '', email = '', password = '', error = '';

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
              "AIO",
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
                      uname = val;
                    });
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "Name",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(height: 10),
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
              child: Text("Sign Me Up!"),
              onPressed: () async {
                FocusScope.of(context).unfocus();

                dynamic result = await _authService.signUp(email, password);
                if (result == null) {
                  setState(() {
                    error = "Could Not Sign You";
                  });
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                }
                // SignIn Method
              },
            ),
          ), // login button
          SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Registered ?",
                  style: TextStyle(
                    color: Colors.yellow.shade900,
                  ),
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  child: Text(
                    "Login!",
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
