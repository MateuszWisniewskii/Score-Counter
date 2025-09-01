import 'package:flutter_test/flutter_test.dart';
import 'package:score_counter/game_controller.dart';

void main() {
  late GameController controller;

  setUp(() {
    controller = GameController();
  });

  group('GameController - logika gry', () {
    test('Punkty początkowe i stan gry', () {
      expect(controller.score1, 0);
      expect(controller.score2, 0);
      expect(controller.quart, 1);
      expect(controller.time, 0);
      expect(controller.isRunning, false);
    });

    test('Setup gry ustawia poprawnie parametry', () {
      controller.setupGame(
        timeMinutes: 5,
        totalRounds: 3,
        maxPoints: 2,
        team1: true,
        team2: false,
        useTimer: true,
      );

      expect(controller.score1, 0);
      expect(controller.score2, 0);
      expect(controller.totalRounds, 3);
      expect(controller.maxPointsPerShot, 2);
      expect(controller.trackTeam1, true);
      expect(controller.trackTeam2, false);
      expect(controller.time, 300); // 5 minut * 60 sekund
    });

    test('Dodawanie punktów dla drużyn', () {
      controller.useTimer = false; // wyłącz timer w testach
      controller.trackTeam1 = true;
      controller.trackTeam2 = true;

      controller.scoreUp(2, 1);
      controller.scoreUp(3, 2);

      expect(controller.score1, 2);
      expect(controller.score2, 3);
    });

    test('Nie dodaje punktów jeśli drużyna nie jest śledzona', () {
      controller.useTimer = false;
      controller.trackTeam1 = false;
      controller.trackTeam2 = false;

      controller.scoreUp(5, 1);
      controller.scoreUp(5, 2);

      expect(controller.score1, 0);
      expect(controller.score2, 0);
    });

    test('Przechodzenie do następnej kwarty', () {
      controller.useTimer = false;
      controller.totalRounds = 3;
      controller.quart = 1;

      controller.nextQuart();
      expect(controller.quart, 2);

      controller.nextQuart();
      expect(controller.quart, 3);

      controller.nextQuart(); // nie powinno przekroczyć totalRounds
      expect(controller.quart, 3);
    });

    test('Formatowanie czasu', () {
      controller.time = 125;
      expect(controller.formatTime(), '02:05');

      controller.time = 5;
      expect(controller.formatTime(), '00:05');

      controller.time = 600;
      expect(controller.formatTime(), '10:00');
    });
  });
}
