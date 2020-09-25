import 'package:flutter/material.dart';
import 'package:lamp/helper/authenticate.dart';
import 'package:lamp/helper/helper.dart';
import 'package:lamp/views/home.dart';
import 'package:lamp/views/intro.dart';

void main() {
  runApp(Root());
}

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  bool userIsLoggedIn = false;
  bool introStatus = false;

  @override
  void initState(){
    getOnboardStaus();
    super.initState();
  }

  getloggedinstatus() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((response){
      print(response);
      if(response == true){
        setState(() {
          userIsLoggedIn = true;
        });
      }
    });
  }

  getOnboardStaus() async {
    await HelperFunctions.getOnboardStatusInSharedPreference().then((response){
      print(response);
      if(response == true){
        getloggedinstatus();
        setState(() {
          introStatus = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return introStatus ? userIsLoggedIn ? Home() : Authenticate() : OnBoardingPage();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // scaffoldBackgroundColor: Color(0xff1f1f1f),
      ),
      home: introStatus ? userIsLoggedIn ? Home() : Authenticate() : OnBoardingPage(),
    );
  }
}

