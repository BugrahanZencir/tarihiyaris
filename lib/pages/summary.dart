import 'package:flutter/material.dart';
import 'package:tarihiyaris/pages/rastgele_screen.dart';
import 'package:firebase_admob/firebase_admob.dart';
class Summary extends StatelessWidget{
  //statefull widget ile yap
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     FirebaseAdMob.instance.initialize(appId: "ca-app-pub-6673149615187752~5210643704");
    myBanner..load()..show();
    return new WillPopScope(
      onWillPop: () async => false,
      child: Container(
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
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Text("Skorun!: $score",
                style: new TextStyle(
                    fontSize: 35.0,
                    color: Colors.white
                ),),

              new Padding(padding: EdgeInsets.all(30.0)),

              new MaterialButton(
                color: Colors.orange,
                onPressed: (){
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                },
                child: new Text("Soruları Tekrardan Çöz",
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                  ),),)

            ],
          ),
        ),
      );
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
  adUnitId: "ca-app-pub-6673149615187752/3820227338",
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);
