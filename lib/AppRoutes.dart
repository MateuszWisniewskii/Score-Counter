import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'BasketBallPage.dart';
import 'SettingsPage.dart';

Map<String,WidgetBuilder> appRoutes = {
  '/': (BuildContext constext) => HomePage(),
  '/basketballpage': (BuildContext context) => BasketBallPage(),
  '/settingspage': (BuildContext context) => SettingsPage()
};