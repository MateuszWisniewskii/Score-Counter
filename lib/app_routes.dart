import 'package:flutter/material.dart';
import 'home_page.dart';
import 'setup_page.dart';
import 'basketball_page.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (BuildContext context) => const HomePage(),
  '/setup': (BuildContext context) => SetupPage(),
  '/basketballpage': (BuildContext context) => const BasketBallPage(),
};
