import 'package:flutter/material.dart';
import '../Reuseable_widgets/myCatButton.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:firebase_cat/component/rounded_button.dart';



class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1), vsync: this
    );
    // animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _controller.forward();
    animation = ColorTween(begin: Colors.cyan[900],end: Colors.white).animate(_controller);


    _controller.addListener(() {
      setState(() {});

    });
  }
@override
  void dispose() {

  _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Widget? load_Or_no = _load_or_no == false ? null : loading_Start();
    return Scaffold(
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
                    height: 50,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 300),
                  text: ['Flash Chat'],
                  textStyle: const TextStyle(
                    // backgroundColor: Colors.black,
                    fontSize: 40.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            MyButton(color: Colors.red, onPressed: () {
              setState(() {
                Navigator.pushNamed(context, LoginScreen.id);
              });
            }, title: Text("login")),

            // my_Button(Colors.red,() {
            //
            // },"login",false),
            MyButton(color:Colors.blueAccent, onPressed: () {
              setState(() {
                Navigator.pushNamed(context, RegistrationScreen.id);
              });
            }, title: Text("register")),
      // my_Button(Colors.blueAccent,() {
      //   Navigator.pushNamed(context, RegistrationScreen.id);
      // },"register",false)
          ],
        ),
      ),
    );
  }
}
