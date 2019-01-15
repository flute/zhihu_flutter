import 'package:flutter/material.dart';

class AskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('提问'),
      ),
      // backgroundColor: Colors.red,
      body: new Container(
        child: new Center(
          child: new Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /* new Icon(
                Icons.favorite,
                size: 160.0,
                color: Colors.black87,
              ), */
              new Text(
                "提问",
                style: new TextStyle(color: Colors.black87),
              )
            ],
          ),
        ),
      ),
    );
  }
}
