import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
          //example of rows and columns widgets
          // uncomment and run whichever layout you want from the three child ones
          //   child: Row(
//               //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.stretch, // the opposite axis to which we have given here
//               //mainAxisAlignment: MainAxisSize.min,
//               children: <Widget>[
//                 Container(
//                   height: 100,
//                   //width: 100, you dont need width if you are streching crossaxis
// // margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
// // margin: EdgeInsets.fromLTRB(100, 100, 100, 100),
// // padding: EdgeInsets.all(20),
// //padding is inside, so text comes center
// //margin is outside
// //usually widgets are single child
// //multi child uses col and rows
//                   color: Colors.greenAccent,
//                   child: Text('Container 1'),
//                 ),
//                 SizedBox(
//                   width:20.0,
//                 ),
//                 Container(
//                   //width: 100,
//                   height: 100,
//                   color: Colors.blue,
//                   child: Text('Container 2'),
//                 ),
//                 Container(
//                  // width: 100,
//                   height: 100,
//                   color: Colors.yellow,
//                   child: Text('Container 3'),
//                 ), // use it in column align
//                 // Container(
//                 //   width: double.infinity,
//                 //   height: 10,
//                 //   color: Colors.white,
//                 // )
//               ],
//             ),

          //----------------------------------------------------------->
          // child: Row(
          //   mainAxisSize: MainAxisSize.max,
          //   crossAxisAlignment: CrossAxisAlignment.baseline,
          //   textBaseline: TextBaseline.alphabetic,
          //   children: <Widget>[
          //     Text(
          //       'Baseline',
          //       style: Theme.of(context).textTheme.displayLarge,
          //     ),
          //     Text(
          //       'Baseline',
          //       style: Theme.of(context).textTheme.bodySmall,
          //     ),
          //   ],
          // ),
          //-------------------------------------------->
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Container(
          //       width:100,
          //       height:double.infinity,
          //       color:Colors.red,
          //     ),
          //
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Container(
          //           width: 100,
          //             height: 100,
          //             color:Colors.yellow,
          //         ),
          //         Container(
          //           width: 100,
          //             height: 100,
          //             color:Colors.green,
          //         )
          //       ],
          //     ),

          //     Container(
          //       width:100,
          //       height:double.infinity,
          //       color:Colors.blue,
          //     ),
          //   ]
          //
          //
          // ),
          //-------------------------------------------->

          // MI CARD
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('images/ranbir.jpeg'),
          ),
          const Text(
            "Afrin Syed",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Pacifico',
              fontSize: 40.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            'Front-end Developer',
            style: TextStyle(
              fontFamily: 'Source Sans',
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5,
              fontSize: 20.0,
              color: Colors.teal.shade100,
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          // if you are using material ui then remove const where it belongs to
          // card doesnt have padding thing inside, so add padding widget

          Card(
            margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            // color: Colors.white,(already cards ar default white)
            // child: Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: <Widget>[
            //       Icon(Icons.phone,
            //       //size: 100.0,
            //         color: Colors.teal.shade900,
            //       ),
            //       SizedBox(
            //         width: 10.0,
            //       ),
            //       Text(
            //         '+91 7730004434',
            //           style: TextStyle(
            //             color: Colors.teal.shade900,
            //             fontSize: 20.0,
            //             fontFamily: 'Source Sans Pro'
            //
            //           )
            //       )
            //     ],
            //   ),
            // ),
            // instead of this child padding and row, we gonna use list tile
            // you can compare with the email one which is written in above method and
            //Lisst tile is muchmore smaller code
            // also the widgets like listtile are respoinsive when compared
            // to our own written code.
            child: ListTile(
              leading: Icon(
                Icons.add_shopping_cart,
                color: Colors.teal.shade900,
              ),
              title: Text(
                '+91 7730004434',
                style: TextStyle(
                  color: Colors.teal.shade900,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.email,
                    //size: 100.0,
                    color: Colors.teal.shade900,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                      'syedafrin002@gmail.com',
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontSize: 20.0,
                          fontFamily: 'Source Sans Pro'

                      )
                  )
                ],
              ),
            ),
          )
        ],
      )),
    ));
  }
}

//hot restart resets the state of the app
//better than run
//hot reload only runs the changes made instead
//of restarting the entire app
