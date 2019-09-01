import 'dart:async';                                          
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarihiyaris/utils/my_navigator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => MyNavigator.goToHomee(context));
  }

  @override
  Widget build(BuildContext context) {
    // Set portrait orientation
SystemChrome.setPreferredOrientations([
   DeviceOrientation.portraitDown,
   DeviceOrientation.portraitUp,
]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
  statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
));
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Colors.purple[900],
                      Colors.purple[800],
                      Colors.purple[700],
                      Colors.purple[600],
                    ]
                )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 80.0,
                        backgroundImage:new AssetImage('assets/ic_launcher.png'),
                      backgroundColor: Colors.transparent,
            
                      ),
                      
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                      ),
                      Text(
                       "Tarihi Yarış", 
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0
                        ),
                      ),
                      Text(
                        "Bir Başka Tarih Yarışı!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0
                        )
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Tarihinizi Sınayarak\n Öğrenin!",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}