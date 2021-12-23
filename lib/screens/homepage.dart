import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:morse/morse.dart';
import 'package:txt_mrs_vib/screens/homepage2.dart';
import 'package:vibration/vibration.dart';
import 'dart:io';

Map timimg = {'-': 200, '.': 50, ' ': 0};


class Mors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class homepage extends StatefulWidget {

  @override
  _homepageState createState() => _homepageState();
}
class _homepageState extends State<homepage> {
  TextEditingController texty = new TextEditingController();

  String code = '';

  void encoder() {
    setState(() {
      String temp = texty.text.toLowerCase();
      code = new Morse(temp).encode();
      
    });
  }

  void vibe() {
    for (int i = 0; i < code.length - 1; i++) {
      int time = timimg[code[i]];
      Vibration.vibrate(duration: time);
      sleep(Duration(milliseconds: time + 100));
    }
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
              "Mors Koduna Çevir!",
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
                onPressed: vibe,
                child: Text(
                  "Titreşim",
                )),
          
          ],
		  
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           ElevatedButton(
             style: ElevatedButton.styleFrom(primary:Color(0xFFFFBE00)),
          onPressed:()  async
          { Navigator.push
            (
              context,
              MaterialPageRoute(builder: (context) => homepage2()),
            );
          },
          child: Text("Mors->Alfabe için tıklayınız!"),),
          ],
		  
        ),Row( 
           mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
         ElevatedButton(
           style: ElevatedButton.styleFrom(primary:Color(0xFFFFBE00)),
          onPressed:()  async
          {
            await FirebaseAuth.instance.signOut();
          },
          child: Text("Çıkış Yap"),),
        ]
        )
        
      ]),
    );
  }
}
