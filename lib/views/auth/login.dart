import 'package:flutter/material.dart';
import 'package:lamp/helper/helper.dart';
import 'package:lamp/views/home.dart';
import 'package:lamp/widgets/widgets.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  final Function toggle;
  LoginScreen(this.toggle);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  bool isLoading = false;

  login() async {
    print("clicked");
//    var url = 'https://www.googleapis.com/books/v1/volumes?q={http}';
//    var url = 'https://jsonplaceholder.typicode.com/todos/1';

//    var response = await http.get(url);
//    var url = 'http://10.0.2.2/api/users/';
//    var token = "9|kBDPid6cn3CPg4qq9funDgmVan8HQqX7yue4xLJ4qFXQkAWXrtOxPk7d9OBBpnebmTvhqBairxmfnp8O";
//    var response = await http.get(url,headers: {"Authorization": "Bearer "+token,'Accept': 'application/json'},);
    if(formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
//    if(true) {
      var login_url = 'http://159.89.203.166/api/mobile/login';
      var response = await http.post(login_url,
        body: convert.jsonEncode({
          "email": emailTextEditingController.text,
          "password": passwordTextEditingController.text,
          "device_name": "mobile"
        }),
        headers: { 'Content-type': 'application/json',
          'Accept': 'application/json',},
      );
//      print(response.body);
//      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
//        print(jsonResponse['user']['name']);
        HelperFunctions.saveUserEmailInSharedPreference(emailTextEditingController.text);
        HelperFunctions.saveUserNameInSharedPreference(jsonResponse['user']['name']);
        HelperFunctions.saveTokenSharedPreference(jsonResponse['token']);
        HelperFunctions.saveUserLoggedInSharedPreference(true);
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => Home()
        ));
        print('logged in successfull');
      } else {
        print('Request failed');
      }
    } // end if
  } // end login()

  @override
  Widget build(BuildContext context) {
    return isLoading ? Center(child: Container(child: CircularProgressIndicator(),))
     : Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Text(
                    'Student',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
                Center(
                  child: Text('Login/Registration'),
                ),
                SizedBox(height: 30,),
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (val){
                          return RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+|\.[a-zA-Z]+")
                              .hasMatch(val)?null:"Please provide valid email address or phone number";
                        },
                        controller: emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: TextFieldInputDecoration("E-mail","Enter E-mail Or Phone Number"),
                      ),
                      SizedBox(height: 18,),
                      TextFormField(
                          validator: (val){
                            return val.length < 6 ?"Password must be at least 6 character": null;
                          },
                          controller: passwordTextEditingController,
                          obscureText: true,
                          style: SimpleTextFieldStyle(),
                          decoration: TextFieldInputDecoration("Password","Enter Password")
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text("Forget Password?",style: SimpleTextFieldStyle(),),
                ),
                SizedBox(height: 18,),
                GestureDetector(
                  onTap: (){
                    login();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red
                        // gradient: LinearGradient(
                        //     colors: [
                        //       const Color(0xff007ef4),
                        //       const Color(0xff2a75bc),
                        //     ]
                        // )
                    ),
                    child: Text("Login", style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),),
                  ),
                ),
                SizedBox(height: 8,),
                Center(
                  child: Text('-OR-'),
                ),
                SizedBox(height: 8,),
                GestureDetector(
                  onTap: (){
                    widget.toggle();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xff007ef4),
                              const Color(0xff2a75bc),
                            ]
                        )
                    ),
                    child: Text("Student Registration", style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),),
                  ),
                ),
                SizedBox(height: 8,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text("Don't have account? ", style: MediumTextFieldStyle(),),
                //     GestureDetector(
                //       onTap: (){
                //         widget.toggle();
                //       },
                //       child: Container(
                //         padding: EdgeInsets.symmetric(vertical: 8),
                //         child: Text("Register", style: TextStyle(
                //           color: Colors.blue,
                //           fontSize: 17,
                //           decoration: TextDecoration.underline,
                //         ),),
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

