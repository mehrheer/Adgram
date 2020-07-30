import 'package:flutter/material.dart';
import '../widgets/button.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Adgram', textAlign: TextAlign.center, style: TextStyle(fontSize: 60.0, fontFamily: 'Pacifico', color: Colors.lightBlueAccent),),
              SizedBox(height: 60.0,),
              ButtonWidget(title: 'INFLUENCER', color: Colors.blue, onPressed: (){Navigator.pushNamed(context, 'login');}),
              ButtonWidget(title: 'ADVERTISER', color: Colors.green, onPressed: (){Navigator.pushNamed(context, 'home');}),
            ],
          ),
        ),
      ),
    );
  }
}
