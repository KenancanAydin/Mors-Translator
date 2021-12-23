import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:txt_mrs_vib/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:txt_mrs_vib/screens/login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LandingPage(),
    );
  }
}
class LandingPage extends StatelessWidget {

final Future<FirebaseApp> _initialization=Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context , snapshot){

        if(snapshot.hasError)
        {return Scaffold(
          body:  Center(
            child:Text("Error: ${snapshot.error}"),
          ),
          );
        }
        if(snapshot.connectionState==ConnectionState.done)
        {
          return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot)
          {
            if(snapshot.connectionState==ConnectionState.active)
            {
              User user=snapshot.data;
              if(user==null)
              {
                return loginpage();
              }
              else
              {
                return homepage();
              }
            }
            return Scaffold(
          body:  Center(
            child:Text("Kimlik doğrulanıyor..."),
          ),
          );
          },
          );

        }
        return Scaffold(
          body:  Center(
            child:Text("Connecting to the app..."),
          ),
          );
      },
    
    );
  }
}