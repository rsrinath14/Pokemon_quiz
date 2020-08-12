import 'dart:convert';
import 'package:flutter/material.dart';
import './Options.dart';

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
                      mydata[0][3.toString()],
                    ),
                  ),
                )),
            Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Options('Pikachu'),
                      Options('Tauros'),
                      Options('Pigiot'),
                      Options('Onyx'),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "10",
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
