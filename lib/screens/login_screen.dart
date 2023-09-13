import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_cat/component/rounded_button.dart';
import 'package:firebase_cat/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import '../Reuseable_widgets/myCatButton.dart';
import 'chat_screen.dart';
import 'loding_now.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

bool _load_or_no = false;

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email_Controller = TextEditingController();
  TextEditingController pass_Controller = TextEditingController();
  String? email;
  String? pass;

  Future signIn_Email_Pass(var email, var pass) async {
    print(email);
    print(pass);
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.toString(), password: pass.toString());
      if (credential != null) {
        setState(() {
          print("setting it by false ");
          _load_or_no = false;
        });
        Navigator.pushNamed(context, ChatScreen.id);
      }
    } catch (e) {
      //remoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooveeeeeeeeevevevevvvvvvvvvvvvvvvvveeeeeeeeeeeeee
      //testing_hole
      if (email == "11" && pass == "11") {
        Navigator.pushNamed(context, ChatScreen.id);
      }
      //remoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooveeeeeeeeevevevevvvvvvvvvvvvvvvvveeeeeeeeeeeeee
      setState(() {
        print("setting it by false ");
        _load_or_no = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundcolor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                email = value;

              },
              controller: email_Controller,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration:
                  K_decoration("enter your email", "default").copyWith(),
            ),
            SizedBox(
              height: 8.0,
            ),
            buildTextField(),
            SizedBox(
              height: 24.0,
            ),
            MyButton(color: Colors.blueAccent, onPressed: () {
              setState(() {
                _load_or_no = true;
                signIn_Email_Pass(email_Controller.text, pass_Controller.text);
              });
            }, title: Text("login"), load_or_no: _load_or_no),
          ],
        ),
      ),
    );
  }

  TextField buildTextField() {
    var visleorno = kvisible_Orno == true
        ? SvgPicture.asset(
            "images/hide-7.svg",
            color: Colors.black54,
          )
        : Icon(Icons.remove_red_eye_rounded);
    return TextField(
      onChanged: (value) {},
      controller: pass_Controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: kvisible_Orno,
      decoration: K_decoration("enter your password", "default").copyWith(
          suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            print("the button pressed");
            print(kvisible_Orno);
            kvisible_Orno = kvisible_Orno == true ? false : true;
          });
        },
        icon: visleorno,
      )),
    );
  }
}
