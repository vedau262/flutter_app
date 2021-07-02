import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class SplashScreenPage  extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenPageState();
}

class SplashScreenPageState extends State<SplashScreenPage>{
  int loadingPercent = 0;

  @override
  Widget build(BuildContext context) {
    caculateScreenSize(context);
    return SplashScreen(
        navigateAfterFuture: loadFromFuture(),
        title: Text(
          'Welcome In SplashScreen',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),),
        image: Image.network(
            'https://s3.o7planning.com/images/triceratops/image1.png'
        ),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter o7planning.org"),
        loadingText: Text("Loading " + this.loadingPercent.toString() +" %"),
        loaderColor: Colors.red
    );
  }

  Future<Widget> loadFromFuture() async {
    while(loadingPercent<100){
      setState(() {
        loadingPercent++;
        print("loading percent: " + loadingPercent.toString());
      });
      await Future.delayed(Duration(microseconds: 100));
    }

    return Future.value(MyHomePage());
  }

  void caculateScreenSize(BuildContext context){
    Size size = MediaQuery.of(context).size;
    double screen_w = size.width;
    double screen_h = size.height;
    print("caculateScreenSize:: screen_w: $screen_w  screen_h: $screen_h");
  }
}