import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lamp/helper/auth.dart';
import 'package:lamp/helper/authenticate.dart';
import 'package:lamp/helper/helper.dart';
import 'package:lamp/models/User.dart';
import 'package:lamp/views/home.dart';
import 'package:lamp/views/photo.dart';
import 'package:lamp/views/video.dart';
import 'package:lamp/widgets/widgets.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:convert';
import 'package:video_player/video_player.dart';
import 'dart:async';

class Photo extends StatefulWidget {
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {


  File photo;
  File nid;
  User user = new User();

  final picker = ImagePicker();
  
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      photo = File(pickedFile.path);
    });
  }
  Future getNid() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      nid = File(pickedFile.path);
    });
  }


  getUser() async {

//    if(true) {
      var token = await HelperFunctions.getUserLoggedInTokenSharedPreference();
      var url = 'http://159.89.203.166/api/mobile/auth-user';
      var response = await http.get(url,
        headers: { 'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer "+token,
          },
      );
      // http.get(url,headers: {"Authorization": "Bearer "+token,'Accept': 'application/json'},);
//      print(response.body);
//      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        // print(jsonResponse);
        setState(() {
          
          this.user = User(
            name: jsonResponse['name'] ?? '',
            phone: jsonResponse['phone'] ?? '',
            email: jsonResponse['email'] ?? '',
            type: jsonResponse['type'] ?? '',
            photo: jsonResponse['photo'] ?? '',
            nid: jsonResponse['nid'] ?? '',
          );
        });
      } else {
        print('Request failed');
      }
  } // end login()

  

  uploadImageHTTP() async {
    //add headers
    var token = await HelperFunctions.getUserLoggedInTokenSharedPreference();
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer " + token
    };
    // var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));

    var request = http.MultipartRequest('POST', Uri.parse('http://159.89.203.166/api/mobile/auth-user/update'));
    request.files.add(await http.MultipartFile.fromPath('photo', photo.path));
    request.files.add(await http.MultipartFile.fromPath('nid', nid.path));
    request.fields['name'] = 'Sabuj Islam';
    request.fields['location'] = 'Mirpur-1';
    request.fields['city'] = 'Dhaka';
    request.fields['country'] = 'Bangladesh';
    request.fields['phone'] = '01775559622';
    request.fields['email'] = 'sabuj0338@gmail.com';
    request.fields['type'] = 'farmer';
    request.fields['zip'] = '1216';
    // request.headers.add('Accept': 'application/json');
    // request.headers.add("Authorization": "Bearer "+token,);
    request.headers.addAll(headers);
    var response = await request.send();
    print(response.statusCode);
    print('done');
    getUser();
    // photo = null;
    // nid = null;

  }



  @override
  void initState() {
    // TODO: implement initState
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo"),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: getImage,
                child: Text('pick photo'),
              ),
              RaisedButton(
                onPressed: getNid,
                child: Text('pick nid'),
              ),
              RaisedButton(
                onPressed: uploadImageHTTP,
                child: Text('Update photo'),
              ),
              RaisedButton(
                onPressed: () async {
                  await getUser();
                },
                child: Text('reload user info'),
              ),
              SizedBox(height: 8,),
              Text(this.user.name.toString().toUpperCase()),
              SizedBox(height: 8,),
              Image.network(
                this.user.photo ?? 'https://strattonapps.com/wp-content/uploads/2020/02/flutter-logo-5086DD11C5-seeklogo.com_.png',
              ),
              SizedBox(height: 8,),
              Image.network(
                this.user.nid ?? 'http://10.0.2.2:8000/uploads/download.png',
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}