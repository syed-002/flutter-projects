import 'package:flutter/material.dart';

// import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

// void main() => runApp(XylophoneApp());

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: XylophoneApp(),
      ),
    );

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKey({required int soundNumber, required Color color}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(soundNumber);
        },
        child: Text(''),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              TextButton(
                onPressed: () {},
                child: Text(
                  'XylophoneApp',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
              ),

              buildKey(soundNumber: 1, color: Colors.red),
              buildKey(soundNumber: 2, color: Colors.orange),
              buildKey(soundNumber: 3, color: Colors.yellow),
              buildKey(soundNumber: 4, color: Colors.green),
              buildKey(soundNumber: 5, color: Colors.teal),
              buildKey(soundNumber: 6, color: Colors.blue),
              buildKey(soundNumber: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
