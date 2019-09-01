
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:fluttertoast/fluttertoast.dart';
InterstitialAd _interstitialAd;
class EarnCreditScreen extends StatefulWidget {
  @override
  _EarnCreditScreenScreenState createState() => new _EarnCreditScreenScreenState();
}

class _EarnCreditScreenScreenState extends State<EarnCreditScreen> {
  @override
  Widget build(BuildContext context) {
     FirebaseAdMob.instance.initialize(appId: "");
    myBanner..load()..show();
    InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: "",
      //Change Interstitial AdUnitId with Admob ID
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("IntersttialAd $event");
        });
  };
    return new Scaffold(
      body: new Container(
          padding: new EdgeInsets.all(20.0),
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

child: Center(child: MaterialButton(
  color: Colors.red,
  onPressed:(){
 createInterstitialAd()
              ..load()
              ..show();
  Fluttertoast.showToast(
        msg: "Desteklerle Daha İyi Hale Gelecek Emin Olabilirsin.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

  } ,
  child: AutoSizeText("Destek Çık"),
),),
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
@override
  void dispose() {
    _interstitialAd.dispose();
  }
