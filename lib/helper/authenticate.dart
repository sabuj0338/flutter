import 'package:flutter/material.dart';
import 'package:lamp/views/auth/login.dart';
import 'package:lamp/views/auth/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showLoginIn = true;

  void toggleView(){
    setState(() {
      showLoginIn = !showLoginIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginIn){
      return LoginScreen(toggleView);
    }else{
      return RegisterScreen(toggleView);
    }
  }
}
