import 'dart:ui';

import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String _optionText;

  Options(this._optionText);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
        child: MaterialButton(
          onPressed: () {},
          child: Text(
            _optionText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
            ),
          ),
          color: Colors.blueGrey[900],
          splashColor: Colors.blueGrey[700],
          highlightColor: Colors.blueGrey[700],
          minWidth: 200,
          height: 40,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        ));
  }
}
