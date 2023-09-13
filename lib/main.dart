import 'package:firebase_cat/store_app/S_checkout.dart';
import 'package:firebase_cat/store_app/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:firebase_cat/screens/welcome_screen.dart';
import 'package:firebase_cat/screens/login_screen.dart';
import 'package:firebase_cat/screens/registration_screen.dart';
import 'package:firebase_cat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'TodoListApp/Prain/ListMap.dart';
import 'TodoListApp/tasks_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'check_hot_reload.dart';

// store project
import 'store_app/S_login.dart';
import 'store_app/S_register.dart';
import 'store_app/S_home.dart';
import 'store_app/S_details_screen.dart';
import 'store_app/provider/cart.dart';

String app_initializer = "todo"; // if you want the message app carefully type (message) for the store (store)
var user_email;
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  FirebaseAuth auth = FirebaseAuth.instance;
  void getCurrentUser() async {
    var user = auth.currentUser;
    if (user == null) {
      user_email = "no";
    } else {
      user_email = user.email;
    }
  }
  if (app_initializer == "message"){
    getCurrentUser();
  }
  //
  runApp(FlashChat());
}
String? initialRoute;
class FlashChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    if (app_initializer == "store"){initialRoute = S_Home.id;}
    else if (app_initializer == "message"){initialRoute = user_email != "no" ? ChatScreen.id : WelcomeScreen.id;}
    else if (app_initializer == "todo"){initialRoute = TasksScreen.id;}



    return ChangeNotifierProvider(
      create: (context) {return TodoItemNotifier();},

      child: MaterialApp(
        debugShowCheckedModeBanner:false ,

        initialRoute: initialRoute,

        routes: {
          TasksScreen.id:(context) => TasksScreen(),
          My_check_out.id:(context) => My_check_out(),
          S_Home.id:(context) => S_Home(),
          Store_register.id:(context) => Store_register(),
          Store_login.id:(context) => Store_login(),
          WelcomeScreen.id:(context) => WelcomeScreen(),// you should activate the getCurrentUser void if you want to run messages app
          LoginScreen.id :(context) => LoginScreen(),
          RegistrationScreen.id :(context) => RegistrationScreen(),
          ChatScreen.id :(context) => ChatScreen(),
        },
      ),
    );
  }
}
