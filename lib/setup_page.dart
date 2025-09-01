import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_counter/game_controller.dart';

class SetupPage extends StatefulWidget {
  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final _formKey = GlobalKey<FormState>();

  int time = 10;
  int rounds = 4;
  int maxPoints = 3;
  bool team1 = true;
  bool team2 = true;
  bool useTimer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ustawienia gry")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SwitchListTile(
              title: const Text("Używaj czasu gry"),
              value: useTimer,
              onChanged: (val) => setState(() => useTimer = val),
            ),
            if (useTimer)
              TextFormField(
                decoration: const InputDecoration(labelText: "Czas gry (minuty)"),
                keyboardType: TextInputType.number,
                initialValue: time.toString(),
                onChanged: (val) => time = int.tryParse(val) ?? 10,
              ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Liczba rund"),
              keyboardType: TextInputType.number,
              initialValue: rounds.toString(),
              onChanged: (val) => rounds = int.tryParse(val) ?? 4,
            ),
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(labelText: "Maks. punkty za rzut"),
              value: maxPoints,
              items: [1, 2, 3, 4, 5]
                  .map((e) => DropdownMenuItem(value: e, child: Text("$e")))
                  .toList(),
              onChanged: (val) => setState(() => maxPoints = val ?? 3),
            ),
            CheckboxListTile(
              title: const Text("Śledź drużynę 1"),
              value: team1,
              onChanged: (val) => setState(() => team1 = val ?? true),
            ),
            CheckboxListTile(
              title: const Text("Śledź drużynę 2"),
              value: team2,
              onChanged: (val) => setState(() => team2 = val ?? true),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Start"),
              onPressed: () {
                final controller = Provider.of<GameController>(
                    context, listen: false);

                controller.setupGame(
                  timeMinutes: time,
                  totalRounds: rounds,
                  maxPoints: maxPoints,
                  team1: team1,
                  team2: team2,
                  useTimer: useTimer,
                );

                Navigator.pushNamed(context, '/gamepage');
              },
            )
          ],
        ),
      ),
    );
  }
}
