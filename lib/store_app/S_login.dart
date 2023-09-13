import 'package:firebase_cat/Reuseable_widgets/OwnTextFieldDecoration.dart';
import 'package:firebase_cat/store_app/S_home.dart';
import 'package:firebase_cat/store_app/S_register.dart';
import 'package:firebase_cat/store_app/constants/S_colors.dart';
import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_cat/Reuseable_widgets/myCatButton.dart';
import 'package:firebase_cat/Reuseable_widgets/myCatTextField.dart';
import 'S_home.dart';

class Store_login extends StatefulWidget {
  static String id = "S_login";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<Store_login>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TextEditingController emailController;

    // Widget? load_Or_no = _load_or_no == false ? null : loading_Start();
    return SafeArea(

      child: Scaffold(

        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                SizedBox(height: 80),
                MyTextField(
                  addDecaration: true,
                  // textEditingController: null,
                  borderSide_color: Colors.grey,
                  borderSide_color_infocas: Colors.blue,
                  decoration_degree: 7.0,
                  hint_text: "enter the email",
                  is_password: false,
                  text_input_type: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                  addDecaration: true,
                  borderSide_color: Colors.grey,
                  borderSide_color_infocas: Colors.blue,
                  decoration_degree: 7.0,
                  hint_text: "enter the password",
                  is_password: true,
                  text_input_type: TextInputType.visiblePassword,
                ),
                    SizedBox(height: 10,),
                MyButton(color: BTNgreen, onPressed: (){Navigator.pushNamed(context, S_Home.id);}, title: Text("Sign in"), load_or_no: false,curveDegree: 7,textcolor: text_color),
                SizedBox(height: 13,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account ?"),
                    TextButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Store_register()));}, child: Text("Sign up",style: TextStyle(fontSize: 18,color: Colors.black),))
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
