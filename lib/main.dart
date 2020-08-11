import 'package:flutter/material.dart';
import 'transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Who is that Pokemon?",
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Color.fromARGB(0xFF, 0x14, 0x1D, 0x26)),
      home: Quiz(),
    );
  }
}
