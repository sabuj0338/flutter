import 'package:flutter/material.dart';
import 'package:lamp/helper/auth.dart';
import 'package:lamp/helper/authenticate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthMethods authMethods = new AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // color: Colors.pink,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            leading: Icon(Icons.album, size: 100.0),
                            title: Text('Heart Shaker', style: TextStyle(color: Colors.black)),
                            subtitle: Text('TWICE', style: TextStyle(color: Colors.black)),
                          ),
                          ButtonTheme.bar(
                            child: ButtonBar(
                              children: <Widget>[
                                FlatButton(
                                  child: const Text('Edit', style: TextStyle(color: Colors.black)),
                                  onPressed: () {},
                                ),
                                FlatButton(
                                  child: const Text('Delete', style: TextStyle(color: Colors.black)),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 28.0,),
                  Card(
                    elevation: 10.0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 55.0,
                                height: 55.0,
                                // color: Colors.green,
                                child: CircleAvatar(
                                  // backgroundColor: Colors.green,
                                  // foregroundColor: Colors.green,
                                  backgroundImage: AssetImage('assets/man.png'),
                                ),
                              ),
                              // SizedBox(width: 8.0,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Sabuj Islam', style: TextStyle(fontSize: 20),),
                                    Text('Expected an identifier,', style: TextStyle(fontSize: 12),),
                                  ],
                                ),
                              ),
                              // SizedBox(width: 8.0,),
                              // Container(
                              //   alignment: Alignment.center,
                              //   padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                              //   child: FlatButton(
                              //     onPressed: (){},
                              //     color: Colors.amber,
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(20.0)
                              //     ),
                              //     child: Text("invite"),
                              //   ),
                              // ),
                              Container(
                                width: 50.0,
                                height: 50.0,
                                // color: Colors.green,
                                child: CircleAvatar(
                                  // backgroundColor: Colors.green,
                                  // foregroundColor: Colors.green,
                                  backgroundImage: AssetImage('assets/man.png'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 28.0,),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                ],
              ),
          // child: Column(
          //   // mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: <Widget>[
              
              // RaisedButton(
              //   onPressed: () {
              //     Navigator.push(context, MaterialPageRoute(
              //         builder: (context) => Video()
              //     ));
              //   },
              //   child: Text('Video Upload'),
              // ),
              // RaisedButton(
              //   onPressed:  () {
              //     Navigator.push(context, MaterialPageRoute(
              //         builder: (context) => Photo()
              //     ));
              //   },
              //   child: Text('Photo Upload'),
              // ),
            // ],
          // ),
        ),
      ),
    );
  }
}