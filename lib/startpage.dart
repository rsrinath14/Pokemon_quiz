import 'dart:async';
import 'dart:convert';

import 'package:PokeQuiz/scoreScreen.dart';
import 'package:flutter/material.dart';
import './scoreScreen.dart';

class Getjson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/pokedata.json"),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());

        if (mydata == null) {
          return Scaffold(
              body: Center(
            child: Text(
              "Loading",
            ),
          ));
        } else {
          return StartPage(mydata: mydata);
        }
      },
    );
  }
}

class StartPage extends StatefulWidget {
  final List mydata;
  StartPage({Key key, @required this.mydata}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState(mydata);
}

class _StartPageState extends State<StartPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List mydata;
  _StartPageState(this.mydata);

  Color colortoshow = Colors.blueGrey[900];
  Color colorright = Colors.green;
  Color colorwrong = Colors.red;
  int marks = 0;
  int i = 1;
  int timer = 5;
  String showTimer = "5";

  Widget options(String k) {
    return AbsorbPointer(
      absorbing: cancelTimer,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        child: MaterialButton(
          onPressed: () => checkanswer(k),
          child: Text(
            mydata[1][i.toString()][k],
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          color: btncolor[k],
          splashColor: Colors.blueGrey[700],
          highlightColor: Colors.blueGrey[700],
          minWidth: 200.0,
          height: 45.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
      ),
    );
  }

  Map<String, Color> btncolor = {
    "a": Colors.blueGrey[900],
    "b": Colors.blueGrey[900],
    "c": Colors.blueGrey[900],
    "d": Colors.blueGrey[900],
  };

  bool cancelTimer = false;

  @override
  void initState() {
    starttimer();
    super.initState();
  }

  showsnackBar(String data, bool correct) {
    // Future.delayed(Duration(seconds: 5),
    //           () => Timer(Duration(seconds: 1), nextquestion));
    final snackBar = SnackBar(
      duration: Duration(seconds: 800),
      backgroundColor: correct ? Colors.green : Colors.red,
      behavior: SnackBarBehavior.floating,
      content: Text(data),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Next question',
        onPressed: () {
          Timer(Duration(seconds: 1), nextquestion);
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          cancelTimer = true;
          showsnackBar('Timer Up', false);
        } else if (cancelTimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showTimer = timer.toString();
      });
    });
  }

  void checkanswer(String k) {
    if (mydata[1][i.toString()][k] == mydata[2][i.toString()]) {
      marks = marks + 1;
      colortoshow = colorright;
      showsnackBar('correct Answer', true);
    } else {
      colortoshow = colorwrong;
      showsnackBar('${mydata[2][i.toString()]} is the correct answer', false);
    }
    setState(() {
      btncolor[k] = colortoshow;
      cancelTimer = true;
      timer = 5;
    });
  }

  void nextquestion() {
    cancelTimer = false;
    timer = 5;
    setState(() {
      if (i < 10) {
        i++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Resultscreen(marks: marks),
        ));
      }
      btncolor["a"] =
          btncolor["b"] = btncolor["c"] = btncolor["d"] = Colors.blueGrey[900];
    });
    starttimer();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            key: _scaffoldKey,
            body: Column(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 300),
                      alignment: Alignment.center,
                      child: cancelTimer
                          ? Image.asset(
                              mydata[3][i.toString()],
                            )
                          : Image.asset(
                              mydata[0][i.toString()],
                            ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          options('a'),
                          options('b'),
                          options('c'),
                          options('d'),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          showTimer,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
              ],
            )),
        onWillPop: () {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(
                      "Pokemon Quiz",
                    ),
                    content: Text(
                      "You are close to becoming a Pokemon Master. Dont miss the opurtunity!",
                    ),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Ok"))
                    ],
                  ));
        });
  }
}
