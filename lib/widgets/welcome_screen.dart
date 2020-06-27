import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.lightBlue,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Center(
          child: Text(
            "Welcome to Goalplan Tic-Tac-Toe",
            style: TextStyle(
              fontSize: 24,
              color: Colors.deepOrange,
            ),
          ),
        ),
      ),
    );
  }
}
