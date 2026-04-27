import 'package:flutter/material.dart';
import '/screens/welcome_screen.dart';
import '/screens/login_screen.dart';
import '/screens/registration_screen.dart';
import '/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // <--- THIS IS MISSING
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        //if you are using the initial route, then you cant use the home property,they are same thing and conflict with each other
        initialRoute: WelcomeScreen.id,
        // home: WelcomeScreen(),
        routes: {
          // 'welcome_screen': (context) => WelcomeScreen(),
          // 'login_screen': (context) => LoginScreen(),
          // 'registration_screen': (context) => RegistrationScreen(),
          // 'chat_screen': (context) => ChatScreen(),

          //the thing with strings is that if there is type, it crashes the app. so you need to use an ID which is a string
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          ChatScreen.id: (context) => ChatScreen(),
          // static is a modifier, we use to modify certain variable before which it is placed so that its now associated with that class. instead of creating Welcome_Screen() object, that id now exists on the class.
          // -bow i no longer need those paranthesis since its not creating any objects, so i will delete them and make it more effiencent.
          //refer those widgets for the static variable being added before the id
        });
  }
}
