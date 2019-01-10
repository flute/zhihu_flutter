import 'package:flutter/material.dart';

class ColleagueTab extends StatelessWidget {
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
                Icons.school,
                size: 160.0,
                color: Colors.black87,
              ),
              new Text(
                "大学",
                style: new TextStyle(color: Colors.black87),
              )
            ],
          ),
        ),
      ),
    );
  }
}
