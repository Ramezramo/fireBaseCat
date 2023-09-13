import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_cat/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'welcome_screen.dart';
import 'package:firebase_cat/check_hot_reload.dart';
import 'package:intl/intl.dart';
// import '';

// hotreload_time hot_reload = hotreload_time();
FirebaseAuth auth = FirebaseAuth.instance;
var user_email;


class ChatScreen extends StatefulWidget {
  static String id = "chat_screen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController message_sender_controler = TextEditingController();
  StreamController<String> streamController = StreamController<String>();
  String? message_text;
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('my_new_database');
  void getCurrentUser() async {
    var user = auth.currentUser;
    if (user == null) {
      print('User is currently signed out!');
      user_email = "ramez developer account";
    } else {
      user_email = user.email;
      print(user.email);
    }
  }
  int counter = 0;
  Future<void> _signOut() async {
    counter++;
    print("signing out the user ");
    await FirebaseAuth.instance.signOut();
    print(counter);
    Navigator.pushNamed(context, WelcomeScreen.id);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          // Text(last_hot_reload),
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {

                _signOut();
              }),
          Hero(
            tag: 'logo',
            child: Container(
              child: Image.asset('images/logo.png'),
            ),
          ),
        ],
        title: Text('Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Messagestream(),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                    },
                    // controller: pass_Controller,
                      controller: message_sender_controler,
                    decoration: K_decoration("enter your message",5.0).copyWith(
                        suffixIcon: IconButton(
                          onPressed: () {
                            DateTime now = new DateTime.now();
                            String formattedTime = DateFormat('EEEE, MMMM d, y hh:mm:ss a').format(now);
                            print(formattedTime);
                            print(user_email);
                            print(message_sender_controler.text);
                            if (message_sender_controler.text != null &&
                                message_sender_controler.text != '' &&
                                message_sender_controler.text!.isNotEmpty) {
                              _firestore.collection('my_new_database').add({
                                "text": message_sender_controler.text,
                                'sender': user_email,
                                'date': formattedTime.toString()
                              });
                              message_sender_controler.clear();
                            }
                          },
                          icon: Icon(Icons.send),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Messagestream extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('my_new_database').orderBy('date',descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error in database');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<Messagebubble> messageBubbles = [];
          snapshot.data!.docs.reversed.forEach((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            var sender = data['sender'] == null ? "null" : data['sender'];
            var text = data['text'] == null ? "null" : data['text'];
            var messageDate = data['date'] == null ? "null" : data['date'];
            var currentUser = user_email;
            bool isme;
            Messagebubble messageBubble =
                Messagebubble(sender, text, messageDate.toString(),currentUser == sender);
            messageBubbles.add(messageBubble);

          });
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          });
          return Expanded(
              child: ListView(
                controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageBubbles,
            shrinkWrap: true,
          ));
        }
      },
    );
  }
}

class Messagebubble extends StatelessWidget {
  Messagebubble(this.sender, this.text, this.messageDate,this.isme);
  final bool isme;
  final String messageDate;
  final String sender;
  final String text;

  String senderNameWithoutGmail(){
    // for separate the user name from @gmail.com
  int theMarkNum = sender.indexOf("@");
  try {
    String senderNameWithoutGmail = sender.substring(0, theMarkNum);
    return senderNameWithoutGmail;
  }catch (e){

    String senderNameWithoutGmail = sender;
    return senderNameWithoutGmail;

  }
  }
  String message_Date_cleaner(){
    // will clean the message date to be in this shape if it (2023 4 7 04:40) it will be (4:40)
    // String message_1th_edit = messageDate.substring(10 , messageDate.length - 7); // deleting the years and month
    // DateTime now = new DateTime.now();
    // String formattedTime = DateFormat('EEEE, MMMM d, y hh:mm:ss a').format(now);
    // print(formattedTime);


    String getting_Time = messageDate.substring(21 , messageDate.length - 6);
    String getting_bm_am = messageDate.substring(30 , messageDate.length - 0);



    print("you test the time in the bubble");
    print(" this is the date ($getting_Time)");
    print('bm or am ($getting_bm_am)');
    print("first char ${getting_Time[0]}");


    if (getting_Time[0] == "0") {
      return "${getting_Time.substring(1 , getting_Time.length)} $getting_bm_am";
    } else {
      return "$getting_Time $getting_bm_am";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0), //a distance between the messageBubble and the screen
      child: Column(
        crossAxisAlignment: isme ?CrossAxisAlignment.end : CrossAxisAlignment.start , // messagebubble in end if you in start if other
        children: [
          Text(
            senderNameWithoutGmail(),// for separate the user name from @gmail.com
            style: TextStyle(fontSize: 12.0, color: Colors.black54),
          ),
          Material(
            borderRadius: isme ? BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30),topRight: Radius.circular(30)) : BorderRadius.only(topRight:  Radius.circular(30),topLeft: Radius.circular(30),bottomRight: Radius.circular(30)),//for message edges if you send it will be from left else right
            elevation: 5.0, //shadow
            color: isme ? Colors.lightBlue: Colors.white54,// if you send message it will be lightblue else it will be white
            child: Column(
              children: [
                Padding(

                  padding: isme ? EdgeInsets.only(left: 20.0,top: 12,right: 25) : EdgeInsets.only(left: 25.0,top: 12,right: 20),
                  child: Text(
                    '$text',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  message_Date_cleaner(),// will clean the message date to be in this shape if it (2023 4 7 04:40) it will be (4:40)
                  style: TextStyle(fontSize: 10.0, color: Colors.black54,),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
