import 'package:flutter/material.dart';
import 'package:tarihiyaris/pages/aboutus_screen.dart';
import 'package:tarihiyaris/pages/earncredit_screen.dart';
import 'package:tarihiyaris/pages/home_screen.dart';
import 'package:tarihiyaris/pages/intro_screen.dart';
import 'package:tarihiyaris/pages/rastgele_screen.dart';
import 'package:tarihiyaris/pages/splash_screen.dart';


var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/intro": (BuildContext context) => IntroScreen(),
  "/rastgele":(BuildContext context) => RastgeleScreen(),
   "/credit":(BuildContext context) => EarnCreditScreen(),
   "/about":(BuildContext context) => AboutusScreen(),
  
};

void main() => runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
routes: routes));