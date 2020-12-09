import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home() : super();
  static const String ROUTE_ID = "home-screen";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GymKhanaIITI"),
      ),
    );
  }
}
