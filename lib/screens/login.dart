import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  String _email;
  String _password;
  Future<void> _createUser()async
  {
    try
    {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email:_email,password:_password);
      print("User: $userCredential");
    }
    on FirebaseAuthException catch(e)
    {
      print("Error:$e");

    }
    catch(e)
    {
      print("Error:$e");
    }

  }
   Future<void> _login()async
  {
    try
    {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email:_email,password:_password);
      print("User: $userCredential");
    }
    on FirebaseAuthException catch(e)
    {
      print("Error:$e");

    }
    catch(e)
    {
      print("Error:$e");
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9A9989),
      appBar: AppBar(
        backgroundColor:Color(0xFFFFBE00) ,
        title: Text("Giriş Yap"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value){
                  _email=value;
                },
                decoration: InputDecoration(
                  hintText: "E-Mail giriniz..."
                ),
              ),
              TextField(
                onChanged: (value){
                  _password=value;
                },
                decoration: InputDecoration(
                  hintText: "Şifre giriniz..."
                ),
              ),
               SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary:Color(0xFFFFBE00)),
                onPressed: _login,
                child: Text("Giriş Yap"),
              ),
              SizedBox(
                width: 20,
              ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary:Color(0xFFFFBE00)),
                  onPressed: _createUser,
                  child: Text("Hesap Oluştur"),
                )
                ],
              )

            
            ],
          ),
      ),
      
    );
  }
}