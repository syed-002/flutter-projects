import 'package:flutter/material.dart';

void main() {
  //running a blank material app
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('I am Rich'),
          backgroundColor: Colors.blueGrey[900],
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/360_F_647491277_CEc0EIRHVlnWkFIgFyoJTtZGCYOjSaNV.jpg'),
          ),
        ),
      ),
    ),
  );
}
