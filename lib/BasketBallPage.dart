import 'package:flutter/material.dart';
import 'dart:async';

class BasketBallPage extends StatefulWidget {
  @override
  State<BasketBallPage> createState() => _BasketBallPageState();
}

class _BasketBallPageState extends State<BasketBallPage> {
  late int _score_1;
  late int _score_2;
  late int? _time;
  Timer? _timer;

  void _scoreUp(int points, int team) {
    setState(() {
      switch (team) {
        case 1:
          _score_1 += points;
          break;
        case 2:
          _score_2 += points;
          break;
      }
    });
  }

  void _startTimer(){

  }

  void _stopTimer(){

  }

  @override
  void initState(){
    super.initState();
    _score_1 = 0;
    _score_2 = 0;
    _time = 14;
    
  }
  //  void _startTimer() {
  //   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       _time++;
  //     });
  //   });
  // }

  // void _stopTimer() {
  //   _timer?.cancel();
  // }

  // void _resetTimer() {
  //   _stopTimer();
  //   setState(() {
  //     _time = 0;
  //   });
  // }

  // @override
  // void dispose() {
  //   _stopTimer(); // bardzo ważne!
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BASKETBALL PAGE")),
      body: Column(
        children: [
          //////////////////////////////////////////////////////////////////////
          // First team section
          //////////////////////////////////////////////////////////////////////
          Container(color: Colors.blueAccent, child: Text("Score: $_score_1")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _scoreUp(1, 1),
                child: Text("+1"),
              ),
              ElevatedButton(
                onPressed: () => _scoreUp(2, 1),
                child: Text("+2"),
              ),
              ElevatedButton(
                onPressed: () => _scoreUp(3, 1),
                child: Text("+3"),
              ),
            ],
          ),
          //////////////////////////////////////////////////////////////////////
          // Time control section
          //////////////////////////////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _startTimer, 
                child: Text("START")),
              Container(
                color: Colors.white70, 
                child: Text("Time: $_time")),
              ElevatedButton(
                onPressed: _stopTimer, 
                child: Text("STOP")),
            ],
          ),
          //////////////////////////////////////////////////////////////////////
          // Second team section
          //////////////////////////////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _scoreUp(1, 2),
                child: Text("+1"),
              ),
              ElevatedButton(
                onPressed: () => _scoreUp(2, 2),
                child: Text("+2"),
              ),
              ElevatedButton(
                onPressed: () => _scoreUp(3, 2),
                child: Text("+3"),
              ),
            ],
          ),
          Container(color: Colors.redAccent, child: Text("Score: $_score_2")),
        ],
      ),
    );
  }
}
