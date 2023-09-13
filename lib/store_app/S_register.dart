import 'package:firebase_cat/Reuseable_widgets/OwnTextFieldDecoration.dart';
import 'package:firebase_cat/store_app/S_login.dart';
import 'package:firebase_cat/store_app/constants/S_colors.dart';
import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_cat/Reuseable_widgets/myCatButton.dart';
import 'package:firebase_cat/Reuseable_widgets/myCatTextField.dart';

class Store_register extends StatefulWidget {
  static String id = "S_register";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<Store_register>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    // Widget? load_Or_no = _load_or_no == false ? null : loading_Start();
    return SafeArea(

      child: Scaffold(

        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(23.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80),
                    MyTextField(
                      addDecaration: true,
                      borderSide_color: Colors.grey,
                      borderSide_color_infocas: Colors.blue,
                      decoration_degree: 7.0,
                      hint_text: "enter your name",
                      is_password: false,
                      text_input_type: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),
                    MyTextField(
                      addDecaration: true,
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
                    MyButton(color: BTNgreen, onPressed: (){


                    }, title: Text("Register"), load_or_no: false,curveDegree: 7,textcolor: text_color),
                    SizedBox(height: 13,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("already have an account ?"),
                        TextButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Store_login()));}, child: Text("Login",style: TextStyle(fontSize: 18,color: Colors.black),))
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
