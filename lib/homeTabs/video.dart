import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return SingleChildScrollView(
      child: new Column(
        children: <Widget>[

          new Container(
            padding: EdgeInsets.all(10),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  height: 200,
                  child: new Stack(
                    children: <Widget>[
                      /* Image.network(
                        '',
                      ), */
                      Container(
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: NetworkImage('https://pic3.zhimg.com/50/v2-b2fa7971a88befd424912e4779b264e3_hd.jpg'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      new Positioned(
                        child: new Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: new Center(
                            child: new Icon(
                              Icons.play_circle_filled,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ),
                      )
                    ],
                    
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: new Text(
                    '你忍不住想看第二遍的一个视频是什么？',
                    style: new TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                ),
                new Row(

                  children: <Widget>[
                    new Expanded(
                      flex: 1,
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            width: 25,
                            height: 25,
                            margin: EdgeInsets.only(right: 5),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage('https://pic4.zhimg.com/50/v2-c2f545104f1bcb17d13c9c1346b19d5f_s.jpg')
                              )
                            ),
                          ),
                          new Text(
                            '张张张旺财',
                          )
                        ],
                      ),
                    ),
                    new Expanded(
                      flex: 1,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[

                          new Container(
                            margin: EdgeInsets.only(left: 10),
                            child: new Row(
                              children: <Widget>[
                                new Icon(Icons.favorite, color: Colors.black26, size: 16),
                                new Container(
                                  margin: EdgeInsets.only(left: 3),
                                  child: new Text('677'),
                                )
                              ],
                            ),
                          ),
                          new Container(
                            margin: EdgeInsets.only(left: 10),
                            child: new Row(
                              children: <Widget>[
                                new Icon(Icons.comment, color: Colors.black26, size: 16),
                                new Container(
                                  margin: EdgeInsets.only(left: 3),
                                  child: new Text('110'),
                                )
                              ],
                            ),
                          ),
                          new Container(
                            margin: EdgeInsets.only(left: 10),
                            child: new Row(
                              children: <Widget>[
                                new Icon(Icons.share, color: Colors.black26, size: 16),
                              ],
                            ),
                          )

                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
