import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MaterialApp(
      home: DicePage(),
    ));

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int totalDiceNumber = 0;
  final player = AudioCache();

  void RollDie() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      totalDiceNumber = rightDiceNumber + leftDiceNumber;
    });
  }

  void PlaySound() {
    player.play('DICE.WAV');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/newbackground.png"),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          child: Align(
              alignment: Alignment(0, -0.5),
              child: Image.asset("assets/diceeLogo.png")),
        ),
        Container(
          child: Align(
              alignment: Alignment(-0.5, 0.2),
              child: Image.asset("assets/dice$leftDiceNumber.png")),
        ),
        Container(
          child: Align(
              alignment: Alignment(0.5, 0.2),
              child: Image.asset("assets/dice$rightDiceNumber.png")),
        ),
        Container(
          child: Align(
              alignment: Alignment(0, 0.5),
              child: '$totalDiceNumber' == '0'
                  ? Text(
                      "Feeling Lucky? Roll the Dice!",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )
                  : Text(
                      "You Rolled $totalDiceNumber",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
              )),
        ),
        Container(
            child: Align(
                alignment: Alignment(0, 0.75),
                child: ElevatedButton(
                  onPressed: () {
                    RollDie();
                    PlaySound();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.redAccent)),
                  child: Text("Roll Dice"),
                )))
      ]),
    );
  }
}
