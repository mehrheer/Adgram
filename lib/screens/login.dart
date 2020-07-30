import 'file:///C:/Users/HP/AndroidStudioProjects/adgram/lib/widgets/textfield.dart';
import 'package:flutter/material.dart';
import '../widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 40.0,),
                  Text('Adgram', textAlign: TextAlign.center, style: TextStyle(fontSize: 60.0, fontFamily: 'Pacifico', color: Colors.lightBlueAccent),),
                  SizedBox(height: 60.0,),
                  InputTextField(
                    obscureText: false,
                    hintText: 'Email',
                    onChanged: (value){
                      email = value;
                    },
                  ),
                  InputTextField(
                    obscureText: true,
                    hintText: 'Password',
                    onChanged: (value){
                      password = value;
                    },
                  ),
                  ButtonWidget(
                      title: 'Log In',
                      color: Colors.lightBlue,
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try{
                          final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                          if(user != null)
                            Navigator.pushNamed(context, 'login');

                          setState(() {
                            showSpinner = false;
                          });
                        }catch(e) {

                        }
                      },
                  ),
                  ButtonWidget(title: 'Sign Up', color: Colors.blueGrey, onPressed: (){Navigator.pushNamed(context, 'signup');}),
                  SizedBox(height: 10.0,),
                  GestureDetector(
                    child: Text('Forgot Password?', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0, color: Colors.grey),),
                    onTap: (){

                    },
                  ),
                  SizedBox(height: 10.0,),
                  GestureDetector(
                    child: Text('Back', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0, color: Colors.grey, decoration: TextDecoration.underline),),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
