import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tarihiyaris/models/questions.dart';
import 'package:tarihiyaris/pages/home_screen.dart';
import 'package:tarihiyaris/pages/summary.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:auto_size_text/auto_size_text.dart';
var finalScore = 0;
var reklamgelmesi=0;
Random rnd;
var questionNumber = 0;
int min = 1;
int max = quiz.questions.length;
int r =  rnd.nextInt(max);
InterstitialAd _interstitialAd;
var quiz = new TarihiSorular();
class RastgeleScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new RastgeleScreenState();
  }
}
class RastgeleScreenState extends State<RastgeleScreen> {
  @override
  Widget build(BuildContext context) {
    //2 soru geçtikten sonra reklam çıksın,,
    //
     FirebaseAdMob.instance.initialize(appId: "Write Add Id");
    myBanner..load()..show();
     InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: "WriteId",
      //Change Interstitial AdUnitId with Admob ID
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("IntersttialAd $event");
        });
  };
    return new WillPopScope(
        onWillPop: () async => false,   
        child: Scaffold(
          body: Container(
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
            alignment: Alignment.center,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(20.0)),
                new Container(
                  alignment: Alignment.center,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                       child: AutoSizeText("Soru ${questionNumber + 1} / ${quiz.questions.length}",
                        style: new TextStyle(
                            fontSize: 22.0,
                            color: Colors.white
                        ),maxLines: 2,  overflow: TextOverflow.ellipsis,minFontSize: 18,maxFontSize: 20, ),
                      ),
                      new Text("Skor: $finalScore",
                        style: new TextStyle(
                            fontSize: 22.0,
                            color: Colors.white
                        ),)
                    ],
                  ),
                ),
                new Image.asset(
                  "images/${quiz.images[questionNumber]}.png",
                ),   //try catch ile null kontrolü yap

                new Padding(padding: EdgeInsets.all(10.0)),

                new AutoSizeText(quiz.questions[questionNumber],
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white
                  ),),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                  children: <Widget>[
                    //button 1
                    Expanded(
                      flex: 1,
                    child: RaisedButton(
                      color: Colors.orangeAccent,
                      onPressed: (){
                        if(quiz.choices[questionNumber][0] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Doğru");
                          finalScore++;
                         reklamgelmesi--;
Fluttertoast.showToast(
        msg: "Doğru Yaptın Böyle Devam!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
                        }
else{
        debugPrint("Yanlış");
        reklamgelmesi++;
        if(reklamgelmesi==2 || reklamgelmesi<=2)
        {
       createInterstitialAd()
              ..load()
              ..show();
        }
        Fluttertoast.showToast(
        msg: "Moral Bozmak Yok En Azından Yanlış Cevabı Biliyorsun!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
                        }
                        updateQuestion();
                      },
                      child: new AutoSizeText(quiz.choices[questionNumber][0],
                        style: new TextStyle(
                            color: Colors.white
                            
                        ), minFontSize: 15, maxLines: 4,maxFontSize: 20,overflow: TextOverflow.ellipsis,),
                    ),

                    ),
                       new SizedBox(
                     width: 40,
                   ),
                    //button 2
                    new Expanded(
                       flex: 1,
                       child: RaisedButton(
                      color: Colors.orangeAccent,
                      onPressed: (){

                        if(quiz.choices[questionNumber][1] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Doğru");
                          finalScore++;
                          Fluttertoast.showToast(
        msg: "Doğru Yaptın Böyle Devam!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
                        }else{
                          debugPrint("Yanlış");
                          if(reklamgelmesi==2 || reklamgelmesi<=2)
        {
       createInterstitialAd()
              ..load()
              ..show();
        }
                               Fluttertoast.showToast(
        msg: "Moral Bozmak Yok En Azından Yanlış Cevabı Biliyorsun!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
                        }
                        updateQuestion();
                      },
                      child: new AutoSizeText(quiz.choices[questionNumber][1],
                        style: new TextStyle(
                            color: Colors.white
                        ),minFontSize: 15, maxLines: 4,maxFontSize: 20,overflow: TextOverflow.ellipsis,),
                    ),
                    ),              

                  ],
                ),

                new Padding(padding: EdgeInsets.all(10.0)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 3
                    new Expanded(
                      flex: 2,
                       child: RaisedButton(
                      color: Colors.orangeAccent,
                      onPressed: (){

                        if(quiz.choices[questionNumber][2] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Doğru");
                          finalScore++;
                          Fluttertoast.showToast(
        msg: "Doğru Yaptın Böyle Devam!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
                        }else{
                          debugPrint("Yanlış");
                                             if(reklamgelmesi==2 || reklamgelmesi<=2)
        {
       createInterstitialAd()
              ..load()
              ..show();
        }
                               Fluttertoast.showToast(
        msg: "Moral Bozmak Yok En Azından Yanlış Cevabı Biliyorsun!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
                        }
                        updateQuestion();
                      },
                      child: new AutoSizeText(quiz.choices[questionNumber][2],
                        style: new TextStyle(
                            color: Colors.white
                        ),minFontSize: 15, maxLines: 4,maxFontSize: 20,overflow: TextOverflow.ellipsis, ),
                    ),

                    ),
                   new SizedBox(
                     width: 40,
                   ),
                    new Expanded(
                      flex: 2,             
                   child: RaisedButton(                                
                      color: Colors.orangeAccent,
                      onPressed: (){
                        if(quiz.choices[questionNumber][3] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Doğru");
                          finalScore++;
                          Fluttertoast.showToast(
        msg: "Doğru Yaptın Böyle Devam!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
                        }else{
                          debugPrint("Yanlış");
                                             if(reklamgelmesi==2 || reklamgelmesi<=2)
        {
       createInterstitialAd()
              ..load()
              ..show();
        }
                               Fluttertoast.showToast(
        msg: "Moral Bozmak Yok En Azından Yanlış Cevabı Biliyorsun!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
                        }
                        updateQuestion();
                      },
                      child: new AutoSizeText(quiz.choices[questionNumber][3],
                        style: new TextStyle(
                            color: Colors.white
                        ),minFontSize: 15, maxLines: 4,maxFontSize: 20,overflow: TextOverflow.ellipsis,),
                    ),
                    ),
                   

                  ],
                ),

                new Padding(padding: EdgeInsets.all(15.0)),

                new Container(
                  alignment: Alignment.bottomCenter,
                  child:  new MaterialButton(
                      minWidth: 240.0,
                      height: 30.0,
                      color: Colors.orangeAccent,
                      onPressed: resetQuiz,
                      child: new Text("Ana Sayfaya Dön",
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.white
                        ),)
                  )
                ),

              ],
            ),
          ),

      )
    );
  }

  void resetQuiz(){
    setState(() {
      Navigator.pop(context);
       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()),ModalRoute.withName("/Home") );
    });
  }



  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore,)));

      }else{
        questionNumber++;
      }
    });
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
  adUnitId: "WriteBannerId",
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