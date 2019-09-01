import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tarihiyaris/pages/aboutus_screen.dart' as prefix0;
import 'package:tarihiyaris/pages/earncredit_screen.dart';
import 'package:tarihiyaris/pages/rastgele_screen.dart';
import 'package:firebase_admob/firebase_admob.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance.initialize(appId: "");
    myBanner..load()..show();
    // TODO: implement build
    return Container(
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
   
   child: Center(
        child: Padding(
          padding: const EdgeInsets.all(89.0),
          child: ListView(
          children: <Widget>[
            new CircleAvatar(
                   radius: 100.0,
                backgroundImage:new AssetImage('assets/ic_launcher.png'),
                backgroundColor: Colors.transparent,
            ),
            new RaisedButton (
  child: Text('Rastgele', style: new TextStyle(fontSize: 24.0,color: Colors.white)),
  color: Colors.white24,
  elevation: 3.0,
  splashColor: Colors.pink,
  onPressed: () {
   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>RastgeleScreen()),ModalRoute.withName("/rastgele"));

  }
   ),
       new SizedBox(
  width: 100, // specific value
  child: RaisedButton(
    child: Text('Destek Çık', style: new TextStyle(fontSize: 20.0,color: Colors.white)),
  color: Colors.white24,
  elevation: 3.0,
  splashColor: Colors.pink,
  onPressed: () {
Navigator.push(context, MaterialPageRoute(
                           builder: (context) =>EarnCreditScreen (),
                         ));
    // Perform some action
  },
  )
), 
   SizedBox(child: RaisedButton (
   child: Text('Uygulama Hakkında', style: new TextStyle(fontSize: 20.0,color: Colors.white)),
  color: Colors.white24,
  elevation: 3.0,
  splashColor: Colors.pink,
  onPressed: () {
   Navigator.push(context, MaterialPageRoute(
                           builder: (context) =>prefix0.AboutusScreen (),
                         ));
  },   ),)  


           ] ),
        ),
   ), ) ;
  }
  
}
MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['bilgiyarisi', 'tarihiyaris'],
  contentUrl: 'https://flutter.io',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);
BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: "",
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);