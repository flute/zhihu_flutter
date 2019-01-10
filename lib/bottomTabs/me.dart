import 'package:flutter/material.dart';

class MeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // backgroundColor: Colors.red,
      body: new Container(
        child: new Center(
          child: new Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.person,
                size: 160.0,
                color: Colors.black87,
              ),
              new Text(
                "First Tab",
                style: new TextStyle(color: Colors.black87),
              )
            ],
          ),
        ),
      ),
    );
  }
}
