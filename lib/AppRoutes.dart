import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'BasketBallPage.dart';

Map<String,WidgetBuilder> appRoutes = {
  '/': (BuildContext constext) => HomePage(),
  '/basketball': (BuildContext context) => BasketBallPage()
};