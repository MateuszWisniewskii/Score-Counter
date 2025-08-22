import 'package:flutter/material.dart';
import 'dart:async';

import 'package:provider/provider.dart';
import 'package:score_counter/basketball_controller.dart';

class BasketBallPage extends StatefulWidget {
  const BasketBallPage({super.key});

  @override
  State<BasketBallPage> createState() => _BasketBallPageState();
}

class _BasketBallPageState extends State<BasketBallPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<BasketballController>(builder: (context, value, child) => Scaffold(
      appBar: AppBar(title: Text("BASKETBALL PAGE")),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //////////////////////////////////////////////////////////////////////
          // First team section
          //////////////////////////////////////////////////////////////////////
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blueAccent,
              child: Text(
                value.score1.toString(),
                style: TextStyle(color: Colors.white, fontSize: 64),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => value.scoreUp(1, 1),
                  child: Text(
                    "+1",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => value.scoreUp(2, 1),
                  child: Text(
                    "+2",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => value.scoreUp(3, 1),
                  child: Text(
                    "+3",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ),
            ],
          ),
          //////////////////////////////////////////////////////////////////////
          // Time control section
          //////////////////////////////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 110.0,
                child: OutlinedButton(
                  onPressed: value.toggleTimer,
                  child: Text(value.isRunning ? "STOP" : "START", textAlign: TextAlign.center),
                ),
              ),
              Column(
                children: [
                  Text(value.time == 0 ? "Time OUT" : "Time left:", textAlign: TextAlign.center),
                  Text(value.formatTime(), textAlign: TextAlign.center, style: TextStyle(fontSize: 48)),
                  Text("Quarter No: ${value.quart}", textAlign: TextAlign.center),
                ],
              ),
              Container(
                width: 110.0,
                child: OutlinedButton(
                  onPressed:
                      value.quart <= 4 ? () => value.nextQuart() : () => value.summary(),
                  child: Text(value.quart < 4 ? "Next quart" : "Summary", textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
          //////////////////////////////////////////////////////////////////////
          // Second team section
          //////////////////////////////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => value.scoreUp(1, 2),
                  child: Text(
                    "+1",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => value.scoreUp(2, 2),
                  child: Text(
                    "+2",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => value.scoreUp(3, 2),
                  child: Text(
                    "+3",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.redAccent,
              child: Text(
                value.score2.toString(),
                style: TextStyle(color: Colors.white, fontSize: 64),
              ),
            ),
          ),
        ],
      ),
    ),);
  }
}