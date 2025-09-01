import 'dart:async';
import 'package:flutter/material.dart';

class GameController extends ChangeNotifier {
  int score1 = 0;
  int score2 = 0;
  int quart = 1;
  int time = 0;

  int totalRounds = 4;
  int initialTime = 600;
  int maxPointsPerShot = 3;
  bool trackTeam1 = true;
  bool trackTeam2 = true;
  bool useTimer = true;

  Timer? _timer;
  bool isRunning = false;

  void setupGame({
    required int timeMinutes,
    required int totalRounds,
    required int maxPoints,
    required bool team1,
    required bool team2,
    required bool useTimer,
  }) {
    score1 = 0;
    score2 = 0;
    quart = 1;

    initialTime = timeMinutes * 60;
    time = initialTime;
    this.totalRounds = totalRounds;
    maxPointsPerShot = maxPoints;
    trackTeam1 = team1;
    trackTeam2 = team2;
    this.useTimer = useTimer;

    notifyListeners();
  }

  void scoreUp(int points, int team) {
    if (useTimer && (_timer == null || !_timer!.isActive)) return;

    if (team == 1 && trackTeam1) {
      score1 += points;
    } else if (team == 2 && trackTeam2) {
      score2 += points;
    }
    notifyListeners();
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
    if ((useTimer && (time > 0 || (_timer?.isActive ?? false))) ||
        quart >= totalRounds) return;

    time = initialTime;
    quart++;
    notifyListeners();
  }

  String formatTime() {
    final minutes = (time ~/ 60).toString().padLeft(2, '0');
    final seconds = (time % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  void summary() {
    stopTimer();
    
  }
}
