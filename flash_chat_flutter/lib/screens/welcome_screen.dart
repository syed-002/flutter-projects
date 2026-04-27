import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id =
      'welcome_screen'; // const becoz i accidently dont change in anothoer class

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;

  //so pretty much the controllers are liner in fashion.. but youwant curved animations.. ie there exits some pattern in them. checkout the curve class animations in flutter docs.
  // lets use deccelarate curve.
  late Animation animation;

  @override
  void initState() {
    super.initState();
    //vsync is the ticker provider.. its gonna be the state object.. here is the welcome screen state.. ie the class itself
    //it inherits the parent class ie the state widget.. we gonan add a keyword.. singletickerprovider..
    //we are upgrading this class as if to act as a ticker..
    //minxin enables your class with different capabilities.
    // the welcome screen state object is gonna be the value for this vsync ticker..
    controller = AnimationController(duration: Duration(seconds: 1), vsync: this,
      // upperBound: 100,// ie the class itself
    // we used to duration of 1 second to change the color.. now we gaonna add the upperbound to 100
    );

    //parent is gonna be a animation controller.. what type is the curve. if again.. these curved animations cannot have upper bound more than 1.. so it should be the from 0 to 1.
    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    animation =ColorTween(begin:Colors.blueGrey, end: Colors.white).animate(controller);
    //color tween to transition from red to blue...

     controller.forward(); // the actual animation we are using.. contorller gonna animate from 0 to 1 is gonna be animated in 60 steps..
    // to see this. we gonna add listener . takes a callback.. which takes animation..

    // we were animating the height of the thunder logo.. from  0 to 100 on animation using curved animaitno.. now i want to make it smaller.. ie from 100 to 0 then.. you can do reverse animation.

    // this is necessary for the loop to start
    //  controller.reverse(from: 1.0);

    
    //but what if i want it to be loop..from small to big and then big to small.. and so on.. for that how we gonna know wehere did the reverse start from. so add a listenener.
    
    // animation.addStatusListener((status){
    //   print (status); //the end of forward animatio is completed and for reversed is dismmed.
    //
    //   if(status == AnimationStatus.completed){
    //     controller.reverse(from: 1.0);
    //   }
    //   else if(status == AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    // });

    // but this takes a lot of resources.. since this will continue forever. until we trash the animation controller.
    // even if the screen is dismissed that animator is not gonna stop.. we shojld dispose in the displose method.
    controller.addListener(() {
      setState(() {});
     // by the empty setState() - as you don't specify what exactly changes so Flutter indeed just calls the whole build method 60 times…
     //  print(controller.value);

      print(animation.value);
    });
    // the final type of animatin is the tween animation. set of prefefined twen animatinos, which goes in between values. ie starting color and ending color.. so our tween goes from begin to end in a smooth transition. .. delete/comment addstatuslisteneer to avoid it bouncing back and forth.
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();// this way doesnt stay in the memory and hogging up the resources.
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // now we can use the controller value to operate smthn.. in this case the background color
       //backgroundColor: Colors.red.withOpacity(controller.value),
      // here its gonna be just one value.. you really cant see any inimation types.. becoz in flutter
      //you need to put it inside setstate

      // backgroundColor: Colors.white,
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                     height: 60.0,
                    // height:animation.value * 100,
                    // height: controller.value, //height would grow from 0 to 100px of height
                  ),
                ),
                TypewriterAnimatedTextKit(
                  // '${controller.value.toInt()}%',// here it would just amimate from 0 to 100% when we add the upper bound as 100
                  text:['Flash Chat'],
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                  speed: Duration(milliseconds: 80),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(color: Colors.lightBlueAccent,
                title: 'Log In',
                onPressed:() {
              Navigator.pushNamed(context, LoginScreen.id);
            }),
            RoundedButton(color: Colors.blueAccent,
                title: 'Register',
                onPressed:() {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
