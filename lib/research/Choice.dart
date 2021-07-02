import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/research/Router.dart';

class Choice {
  const Choice({required this.title, required this.icon, required this.nav});
  final String title;
  final IconData icon;
  final String nav;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'home', icon: Icons.timer, nav: home),
  const Choice(title: 'details', icon: Icons.event_seat, nav: details),
  const Choice(title: 'about', icon: Icons.shuffle, nav: about),
  const Choice(title: 'cardDemo', icon: Icons.group_add, nav: cardDemo),
];