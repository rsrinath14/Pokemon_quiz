import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

class getjson extends StatelessWidget {
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
  List mydata;
  StartPage({Key key, @required this.mydata}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState(mydata);
}

class _StartPageState extends State<StartPage> {
  List mydata;
  _StartPageState(this.mydata);

  Color colortoshow = Colors.blueGrey[900];
  Color colorright = Colors.green;
  Color colorwrong = Colors.red;
  int marks = 0;
  int i = 1;
  int timer = 10;
  String showTimer = "10";

  Widget Options(String k) {
    return Padding(
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
    );
  }

  Map<String, Color> btncolor = {
    "a": Colors.blueGrey[900],
    "b": Colors.blueGrey[900],
    "c": Colors.blueGrey[900],
    "d": Colors.blueGrey[900],
  };

  void initState() {
    starttimer();
    super.initState();
  }

  void nextquestion() {
    setState(() {
      if (i < 10) {
        i++;
      } else {}
      btncolor["a"] = Colors.blueGrey[900];
      btncolor["b"] = Colors.blueGrey[900];
      btncolor["c"] = Colors.blueGrey[900];
      btncolor["d"] = Colors.blueGrey[900];
    });
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else {
          timer = timer - 1;
        }
        showTimer = timer.toString();
      });
    });
  }

  void checkanswer(String k) {
    if (mydata[1]["1"][k] == mydata[2]["1"]) {
      marks = marks + 1;
      colortoshow = colorright;
    } else {
      colortoshow = colorwrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
    });

    Timer(Duration(seconds: 1), nextquestion);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            body: Column(
          children: <Widget>[
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      mydata[0][i.toString()],
                    ),
                  ),
                )),
            Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Options('a'),
                      Options('b'),
                      Options('c'),
                      Options('d'),
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
