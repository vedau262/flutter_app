import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'About.dart';
import 'CardDemo.dart';
import 'Details.dart';
import 'Home.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case details:
        return MaterialPageRoute(builder: (_) => DetailsPage());
      case about:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case cardDemo:
        return MaterialPageRoute(builder: (_) => CardDemo());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}

//Dynamic Routes for generating navigation
const String home = '/home';
const String details = '/details';
const String about = '/about';
const String cardDemo = '/cardDemo';
const String myListView = '/myListView';
const String myListView2 = '/myListView2';
const String parent = '/Parent';
const String demoPage = '/demoPage';
const String examplePage = '/ExamplePage';