import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_counter/basketball_controller.dart';

class BasketBallPage extends StatelessWidget {
  const BasketBallPage({super.key});

  List<Widget> _buildScoreButtons(BasketballController value, int team) {
    return List.generate(value.maxPointsPerShot, (i) {
      final points = i + 1;
      return Expanded(
        child: OutlinedButton(
          onPressed: () => value.scoreUp(points, team),
          style: TextButton.styleFrom(
            backgroundColor: team == 1 ? Colors.blue : Colors.red,
          ),
          child: Text(
            "+$points",
            style: const TextStyle(color: Colors.white, fontSize: 32),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BasketballController>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(title: const Text("BASKETBALL PAGE")),
        body: Column(
          children: [
            if (value.trackTeam1) ...[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blueAccent,
                  child: Text(
                    value.score1.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 64),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildScoreButtons(value, 1),
              ),
            ],
            if (value.useTimer) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 110.0,
                    child: OutlinedButton(
                      onPressed: value.toggleTimer,
                      child: Text(
                        value.isRunning ? "STOP" : "START",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        value.time == 0 ? "Time OUT" : "Time left:",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        value.formatTime(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 48),
                      ),
                      Text("Round: ${value.quart}/${value.totalRounds}",
                          textAlign: TextAlign.center),
                    ],
                  ),
                  SizedBox(
                    width: 110.0,
                    child: OutlinedButton(
                      onPressed: value.quart < value.totalRounds
                          ? () => value.nextQuart()
                          : () => value.summary(),
                      child: Text(
                        value.quart < value.totalRounds
                            ? "Next round"
                            : "Summary",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            if (value.trackTeam2) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildScoreButtons(value, 2),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.redAccent,
                  child: Text(
                    value.score2.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 64),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
