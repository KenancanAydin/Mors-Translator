import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:morse/morse.dart';
import 'dart:io';

import 'homepage.dart';

Map timimg = {'-': 200, '.': 50, ' ': 0};

class Mors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepage2(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}
class homepage2 extends StatefulWidget {

  @override
  _homepageState createState() => _homepageState();
}
class _homepageState extends State<homepage2> {
  TextEditingController texty = new TextEditingController();

  String code = '';

  void encoder() {
    setState(() {
      String temp = texty.text;
      code =  new Morse(temp).decode();
     
      
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9A9989),
      appBar: AppBar(
        backgroundColor:Color(0xFFFFBE00) ,
        title: Text('Mors Translator'),
      ),
      body: Column(children: <Widget>[
        TextField(
          controller: texty,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary:Color(0xFFFFBE00)),
            onPressed: encoder,
            child: Text(
              "Alfabeye Çevir!",
            )),
       
Row(
  children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Color(0xFFFFBE00),
                      thickness: 3,
                      height: 36,
                    )),
              )      
    ]
),
            Text.rich(
  TextSpan(
    text: code, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30 ) ,
  ),
),

            Row(children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Color(0xFFFFBE00),
                      thickness: 3,
                      height: 36,
                    )),
              )      
    ]
),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
           ElevatedButton(
             style: ElevatedButton.styleFrom(primary:Color(0xFFFFBE00)),
          onPressed:()  async
          {
            Navigator.push
            (
              context,
              MaterialPageRoute(builder: (context) => homepage()),
            );
          },
          child: Text("Alfabe->Mors için tıklayınız!"),),
          ],
		  
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           ElevatedButton(
             style: ElevatedButton.styleFrom(primary:Color(0xFFFFBE00)),
          onPressed:()  async
          {
            await FirebaseAuth.instance.signOut();
          },
          child: Text("Çıkış Yap"),),
          ],
		  
        ),
      ]),
    );
  }
}
