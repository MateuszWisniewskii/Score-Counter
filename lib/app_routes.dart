import 'package:flutter/material.dart';
import 'home_page.dart';
import 'basketball_page.dart';
import 'settings_page.dart';

Map<String,WidgetBuilder> appRoutes = {
  '/': (BuildContext constext) => HomePage(),
  '/basketballpage': (BuildContext context) => BasketBallPage(),
  '/settingspage': (BuildContext context) => SettingsPage()
};