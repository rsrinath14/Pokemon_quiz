import 'dart:async';

import 'package:PokeQuiz/startpage.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => StartPage(),
      ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Container(
            height: 500,
            width: 500,
            child: Image.asset("assets/images/poke.jpg"),
          ),
        ],
      ),
    );
  }
}
