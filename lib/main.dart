import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_counter/app_routes.dart';
import 'package:score_counter/basketball_controller.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => BasketballController(),child: MainApp(),));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Score Counter",
      routes: appRoutes,
    );
  }
}
