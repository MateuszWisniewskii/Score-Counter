import 'package:flutter/material.dart';
import 'package:score_counter/AppRoutes.dart';

void main() {
  runApp(MainApp());
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
