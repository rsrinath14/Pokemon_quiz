import 'package:flutter/material.dart';

class Resultscreen extends StatefulWidget {
  int marks;
  Resultscreen({Key key, @required this.marks}) : super(key: key);
  @override
  _ResultsState createState() => _ResultsState(marks);
}

class _ResultsState extends State<Resultscreen> {
  String img_address;
  String message;
  String score;
  int marks;

  @override
  void initState() {
    if (marks < 5) {
      img_address = "assets/images/picka_confussed.gif";
      message = "Not a Pokemon Fan ?  You need to brush up your knowledge...";
      score = marks.toString();
    } else if (marks > 4 && marks < 8) {
      img_address = "assets/images/picka_improve.gif";
      message =
          "Pickachu is proud of you.. But there is still room for improvement";
      score = marks.toString();
    } else {
      img_address = "assets/images/picka_happy.gif";
      message =
          "Ash Ketchum is that you? Pickachu is very happy and proud of you!";
      score = marks.toString();
    }
    super.initState();
  }

  _ResultsState(this.marks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Results"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Image.asset(img_address),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        message,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 300,
                      child: Text("Score:" + "   " + score,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: OutlineButton(
                        child: Text("Continue",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        onPressed: null),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[],
              ),
            )
          ],
        ));
  }
}
