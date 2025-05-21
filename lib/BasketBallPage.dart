import 'package:flutter/material.dart';
import 'dart:async';

class BasketBallPage extends StatefulWidget {
  const BasketBallPage({super.key});

  @override
  State<BasketBallPage> createState() => _BasketBallPageState();
}

class _BasketBallPageState extends State<BasketBallPage> {
  late int _score_1;
  late int _score_2;
  late int _quart;
  late int _time;
  Timer? _timer;
  late bool _isRunning;

  void _scoreUp(int points, int team) {
    if (_timer != null && _timer!.isActive) {
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
  }

  void _startTimer() {
    if (_timer != null && _timer!.isActive) return;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_time > 0) {
        setState(() {
          _time--;
        });
      } else {
        timer.cancel();
        _timer = null;
      }
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  void _toggleTimer() {
    if (!_isRunning) {
      _startTimer();
    } else {
      _stopTimer();
    }
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  void _nextQuart() {
    if ((_timer != null && _timer!.isActive) || _time != 0 || _quart >= 4)
      return;

    setState(() {
      _time = 600; // 10 minutes
      _quart++;
    });
  }

  void _summary() {} // TO DO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  String _formatTime(int secondsLeft){
  final minutes = (secondsLeft ~/ 60).toString().padLeft(2, '0');
  final seconds = (secondsLeft % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void initState() {
    super.initState();
    _score_1 = 0;
    _score_2 = 0;
    _time = 600; // 10 minutes
    _quart = 1;
    _isRunning = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "$_score_1",
                style: TextStyle(color: Colors.white, fontSize: 64),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _scoreUp(1, 1),
                  child: Text(
                    "+1",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _scoreUp(2, 1),
                  child: Text(
                    "+2",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _scoreUp(3, 1),
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
                  onPressed: _toggleTimer,
                  child: Text(_isRunning ? "STOP" : "START", textAlign: TextAlign.center),
                ),
              ),
              Column(
                children: [
                  Text(_time == 0 ? "Time OUT" : "Time left:", textAlign: TextAlign.center),
                  Text(_formatTime(_time), textAlign: TextAlign.center, style: TextStyle(fontSize: 48)),
                  Text("Quarter No: $_quart", textAlign: TextAlign.center),
                ],
              ),
              Container(
                width: 110.0,
                child: OutlinedButton(
                  onPressed:
                      _quart <= 4 ? () => _nextQuart() : () => _summary(),
                  child: Text(_quart < 4 ? "Next quart" : "Summary", textAlign: TextAlign.center),
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
                  onPressed: () => _scoreUp(1, 2),
                  child: Text(
                    "+1",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _scoreUp(2, 2),
                  child: Text(
                    "+2",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _scoreUp(3, 2),
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
                "$_score_2",
                style: TextStyle(color: Colors.white, fontSize: 64),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
