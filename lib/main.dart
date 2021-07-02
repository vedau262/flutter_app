import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/research/ProviderDemo.dart';
import 'package:flutter_app/research/PutValue.dart';
import 'package:flutter_app/research/bloc/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'research/About.dart';
import 'research/CardDemo.dart';
import 'research/Details.dart';
import 'research/Home.dart';
import 'research/MyListView.dart';
import 'research/Router.dart';
import 'research/Splash.dart';

String TAG = "demo: ";
enum Fruits { Apple, Pear, Grapes, Banana, Orange }
bool checkEven(int value) => value%2==0;
void testInner(int value) {
// Nested function
  int randomValue() => Random().nextInt(10);
// Using the nested funcion
  final number = value + randomValue();
  print(TAG + "$number");
}


void main() {
  runApp(
      // ProviderDemoApp()
      MyApp()
   /* ChangeNotifierProvider(
      create: (context) => Something(),
      child: MyApp(),
    ),*/

  );

}

class MyApp extends StatelessWidget {
  const MyApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const DemoPage(),
    );*/

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),

      /*ThemeData(
        primarySwatch: Colors.blue,
        buttonColor: Colors.red, // Color of a RaisedButton
        focusColor: Colors.white, // Color when a widget is focused
        selectedRowColor: Colors.orange,
        primaryColor: Colors.green,
        accentColor: Colors.red,
      ),*/

      home: MyHomePageBloc(),

      routes: <String, WidgetBuilder>{
        home: (BuildContext context) => MyHomePage(),
        details: (BuildContext context) => DetailsPage(),
        about: (BuildContext context) => AboutPage(),
        cardDemo: (BuildContext context) => CardDemo(),
        myListView: (BuildContext context) => MyListView(),
        myListView2: (BuildContext context) => MyListView2(),
        parent: (BuildContext context) => Parent(),
        examplePage: (BuildContext context) => ExamplePage(),
      },
    );
  }


}







