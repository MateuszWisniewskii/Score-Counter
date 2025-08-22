import 'dart:async';
import 'package:flutter/material.dart';

class BasketballController extends ChangeNotifier {
  int score1 = 0;
  int score2 = 0;
  int quart = 1;
  int time = 600; // 10 minut
  Timer? _timer;
  bool isRunning = false;

  void scoreUp(int points, int team) {
    if (_timer != null && _timer!.isActive) {
      if (team == 1) {
        score1 += points;
      } else {
        score2 += points;
      }
      notifyListeners();
    }
  }

  void _startTimer() {
    if (_timer != null && _timer!.isActive) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time > 0) {
        time--;
        notifyListeners();
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    isRunning = false;
    notifyListeners();
  }

  void toggleTimer() {
    if (!isRunning) {
      _startTimer();
    } else {
      stopTimer();
    }
    isRunning = !isRunning;
    notifyListeners();
  }

  void nextQuart() {
    if ((_timer != null && _timer!.isActive) || time != 0 || quart >= 4) return;
    time = 600;
    quart++;
    notifyListeners();
  }

  String formatTime() {
    final minutes = (time ~/ 60).toString().padLeft(2, '0');
    final seconds = (time % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  void summary(){
    
  }
}
