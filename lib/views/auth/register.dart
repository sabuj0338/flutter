import 'package:flutter/material.dart';
import 'package:lamp/helper/authenticate.dart';
import 'package:lamp/views/auth/login.dart';
import 'package:lamp/widgets/widgets.dart';
import 'package:lamp/helper/helper.dart';
import 'package:lamp/views/home.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  final Function toggle;
  RegisterScreen(this.toggle);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  TextEditingController userTypeTextEditingController = new TextEditingController();
  TextEditingController fullNameTextEditingController = new TextEditingController();
  TextEditingController phoneTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();
  TextEditingController passwordConfirmationTextEditingController = new TextEditingController();

  register() async {
    if(formKey.currentState.validate()){
      setState(() {
        isLoading = false;
      });
      var register_url = 'http://10.0.2.2:8000/api/mobile/register';
      var response = await http.post(register_url,
        body: convert.jsonEncode({
          "name": fullNameTextEditingController.text,
          "user_type": userTypeTextEditingController.text,
          "phone": phoneTextEditingController.text,
          "email": emailTextEditingController.text,
          "password": passwordTextEditingController.text,
          "password_confirmation": passwordConfirmationTextEditingController.text,
        }),
        headers: { 'Content-type': 'application/json',
          'Accept': 'application/json',},
      );
//      print(response.body);
      if (response.statusCode == 201) {
        var jsonResponse = convert.jsonDecode(response.body);
//        _showDialog();
        widget.toggle();
//        Navigator.pushReplacement(context, MaterialPageRoute(
//            builder: (context) => Home()
//        ));
      } else {
        print('Request failed');
      }
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
//      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Registration Successfull"),
          content: Text("Login Now"),
          actions: <Widget>[
            FlatButton(
              child: Text("Login"),
              onPressed: () {
                widget.toggle();
              },
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? Center(child: Container(child: CircularProgressIndicator(),)): SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 10,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (val){
                          return val.isEmpty || val.length < 2?"User type field required":null;
                        },
                        controller: userTypeTextEditingController,
                        style: SimpleTextFieldStyle(),
                        decoration: TextFieldInputDecoration("User Type","Enter User Type"),
                      ),
                      SizedBox(height: 18,),
                      TextFormField(
                        validator: (val){
                          return val.isEmpty || val.length < 2?"Please provide your full name":null;
                        },
                        controller: fullNameTextEditingController,
                        style: SimpleTextFieldStyle(),
                        decoration: TextFieldInputDecoration("Full Name","Enter Full Name"),
                      ),
                      SizedBox(height: 18,),
                      TextFormField(
                        validator: (val){
                          return val.isEmpty || val.length < 2?"Please valid phone number":null;
                        },
                        controller: phoneTextEditingController,
                        style: SimpleTextFieldStyle(),
                        decoration: TextFieldInputDecoration("Phone Number","Enter Phone Number"),
                      ),
                      SizedBox(height: 18,),
                      TextFormField(
                        validator: (val){
                          return RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+|\.[a-zA-Z]+")
                              .hasMatch(val)?null:"Please provide valid email address";
                        },
                        controller: emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        style: SimpleTextFieldStyle(),
                        decoration: TextFieldInputDecoration("E-mail","Enter E-mail"),
                      ),
                      SizedBox(height: 18,),
                      TextFormField(
                          validator: (val){
                            return val.length < 8 ?"Password must be at least 6 character": null;
                          },
                          controller: passwordTextEditingController,
                          style: SimpleTextFieldStyle(),
                          decoration: TextFieldInputDecoration("Password","Enter Password")
                      ),
                      SizedBox(height: 18,),
                      TextFormField(
                          validator: (val){
                            return val.length < 8 ?"Confirm Password": null;
                          },
                          controller: passwordConfirmationTextEditingController,
                          style: SimpleTextFieldStyle(),
                          decoration: TextFieldInputDecoration("Confirm Password","Confirm Password")
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text("Forget Password?",),
                ),
                SizedBox(height: 18,),
                GestureDetector(
                  onTap: (){
                    //register
                    register();
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
                    child: Text("Register", style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),),
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Text("Register with Google", style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),),
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have account? ", style: MediumTextFieldStyle(),),
                    GestureDetector(
                      onTap: (){
                        widget.toggle();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("Login", style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                        ),),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
