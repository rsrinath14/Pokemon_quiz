import 'package:flutter/material.dart';
import './Options.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset("assets/images/tauros.png"),
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
    ));
  }
}
