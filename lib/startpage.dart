import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            )),
        Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            )),
        Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            )),
      ],
    ));
  }
}
