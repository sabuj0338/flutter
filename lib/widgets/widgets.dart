import 'package:flutter/material.dart';

Widget AppBarMain (BuildContext context) {
  return AppBar(
    title: Text('Authentication'),
    elevation: 0,
    centerTitle: true,
  );
}

InputDecoration TextFieldInputDecoration(String hintText, String labelText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey[500]),
      contentPadding: EdgeInsets.all(20.0),
      // labelText: labelText,
      fillColor: Colors.white,
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(8.0),
        borderSide: new BorderSide(color: Colors.black12,width: 5.0),
      ),
      filled: true,
      // focusColor: Colors.white,
      // hoverColor: Colors.white,
      // icon: Icon(Icons.search,color: Colors.white,),
      // focusedBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: Colors.red[500]),
      //   borderRadius: BorderRadius.circular(8.0),
      // ),
      // enabledBorder: UnderlineInputBorder(
      //   borderSide: BorderSide(color: Colors.black12),
      //   borderRadius: BorderRadius.circular(8.0),
      // ),
  );
}

TextStyle SimpleTextFieldStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 16,
  );
}

TextStyle MediumTextFieldStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 17,
  );
}