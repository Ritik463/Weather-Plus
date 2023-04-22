import 'package:flutter/material.dart';
import 'activity/loding.dart';
import 'activity/location.dart';
import 'activity/home.dart';
import 'activity/loding.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Loading(isLoading: true),
      "/home": (context) => const Home(),
      "/loading": (context) => Loading(isLoading: false),
    },
  ));
}
