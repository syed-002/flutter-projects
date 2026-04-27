import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}
//shortcuts stless and stful

class DicePage extends StatefulWidget {
  // const ({super.key});
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  int leftDiceNumber=1;
  int rightDiceNumber=6;
  @override
  Widget build(BuildContext context) {

    void changeFaces(){
      setState(() {
        leftDiceNumber= Random().nextInt(6)+1; // give 0-5
        //botht the buttons updating
        rightDiceNumber= Random().nextInt(6)+1;
      });

    }

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            // width: 200.0, -- hardcoding is not recommended.
            // making it adaptable by embedding an expanded widget on image widget

            // child: Image(
            //   image: AssetImage('images/dice1.png'),
            // ),
            // this above method is so common thaat they created a widget for asset image itself for consize code
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: (){
                  setState(() {
                    // leftDiceNumber= Random().nextInt(6)+1; // give 0-5
                    // botht the buttons updating
                    // rightDiceNumber= Random().nextInt(6)+1;
                    // print('left button got pressed: $leftDiceNumber');
                    changeFaces();
                  });
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),

            //flex:2, // twice as the size of second dice when flex is 1 in that dice properties
          ),

          Expanded(
            //flex:1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: (){
                  setState(() {
                    // rightDiceNumber= Random().nextInt(6)+1;
                    //
                    // print('right button got pressed: $rightDiceNumber');
                    changeFaces();
                    changeFaces();
                  });
                },
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

