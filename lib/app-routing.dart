import 'package:amazon_prime_clone/screens/about/about_page.dart';
import 'package:amazon_prime_clone/screens/home/home.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  MyHomePage.routeName: (context) => MyHomePage(),
  AboutPage.routeName: (context) => AboutPage(),
};
