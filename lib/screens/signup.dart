import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
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
                      title: 'Sign Up',
                      color: Colors.lightBlue,
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try{
                          final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                          if(newUser != null)
                            Navigator.pushNamed(context, 'login');

                          setState(() {
                            showSpinner = false;
                          });
                        }catch(e){

                        }
                      },
                  ),
                  ButtonWidget(title: 'Login', color: Colors.blueGrey, onPressed: (){Navigator.pop(context);}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
