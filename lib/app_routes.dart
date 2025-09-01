import 'package:flutter/material.dart';
import 'home_page.dart';
import 'setup_page.dart';
import 'game_page.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (BuildContext context) => const HomePage(),
  '/setup': (BuildContext context) => SetupPage(),
  '/gamepage': (BuildContext context) => const GamePage(),
};
