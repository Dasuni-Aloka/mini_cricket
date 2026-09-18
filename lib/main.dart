import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MiniCricketApp());
}

class MiniCricketApp extends StatelessWidget {
  const MiniCricketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Cricket',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CricketPage(),
    );
  }
}

class CricketPage extends StatefulWidget {
  const CricketPage({super.key});

  @override
  State<CricketPage> createState() => _CricketPageState();
}

class _CricketPageState extends State<CricketPage> {
  int runs = 0;
  int balls = 6;
  String result = '';

  final Random random = Random();

  void playBall() {
    if (balls == 0) return;

    int possibleRun = [0, 1, 2, 3, 4, 6][random.nextInt(6)];

    setState(() {
      runs += possibleRun;
      balls--;

      if (possibleRun == 0) {
        result = 'No Runs';
      } else {
        result = '$possibleRun ${possibleRun == 1 ? 'Run' : 'Runs'}';
      }
    });
  }

  void restartGame() {
    setState(() {
      runs = 0;
      balls = 6;
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Mini Cricket'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // BAT
                Column(
                  children: [
                    Container(
                      width: 105,
                      height: 105,
                      color: Colors.white,
                      child: const Center(
                        child: Text(
                          '🏏',
                          style: TextStyle(fontSize: 65),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Runs',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '$runs',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // BALL
                Column(
                  children: [
                    Container(
                      width: 105,
                      height: 105,
                      color: Colors.white,
                      child: const Center(
                        child: Text(
                          '🔴',
                          style: TextStyle(fontSize: 60),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Balls',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '$balls',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 15),

            Text(
              result,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 18),

            if (balls > 0)
              ElevatedButton(
                onPressed: playBall,
                child: const Text('Bat'),
              )
            else
              ElevatedButton(
                onPressed: restartGame,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Restart'),
              ),

            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}