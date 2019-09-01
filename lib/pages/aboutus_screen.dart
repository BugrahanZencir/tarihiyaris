
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
class AboutusScreen extends StatefulWidget {
  @override
  _AboutusScreenState createState() => new _AboutusScreenState();
}

class _AboutusScreenState extends State<AboutusScreen> {
  @override
  Widget build(BuildContext context) {
     FirebaseAdMob.instance.initialize(appId: "");
    myBanner..load()..show();
    return new Scaffold(
      body: new Container(
          padding: new EdgeInsets.all(60.0),
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
      
child:Column(
 children: <Widget>[
    AutoSizeText('İlk Olarak Java Dili ile geliştirilen uygulamamız şuan da flutter dili ile geliştirilmekte olup desteklerinizi beklemekteyiz.,Flutter ile proje geliştirenler ve geliştirmek isteyenler karahansoftware@gmail.com adresine mail atabilirler.\n',style: TextStyle(color: Colors.white),),
     AutoSizeText('Küçük Projelerden Büyük Projeler Doğar Bunu Unutmamak Gerekir! \n Desteklerinizi Bekliyoruz! \n',style: TextStyle(color: Colors.white),),
      new Image.asset(
                  "images/turkey.png",
                ),   //try catch

 ],
) ,

      ),
    );
  }
  _performLogin() {

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