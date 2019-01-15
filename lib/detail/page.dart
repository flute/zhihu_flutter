import 'package:flutter/material.dart';
import 'package:zh/home/searchPage.dart';

class DetailPage extends StatefulWidget {
  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  final GlobalKey _menuKey = new GlobalKey();
  
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
        title: new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              new Expanded(
                child: new Container(
                  height: 40,
                  margin: EdgeInsets.only(right: 30),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: new FlatButton.icon(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return new SearchPage();
                      }));
                    },
                    color: Colors.grey[200],
                    textColor: Colors.black54,
                    icon: Icon(Icons.search),
                    label: new Text(
                      '搜索知乎内容'
                    ),
                  ),
                ),
              ),
              new Container(
                //color: Colors.black,
                child: new Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
      body: new Column(
        children: <Widget>[

          // 问题
          new Container(
            color: Colors.white,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Container(
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                              decoration: new BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Text('数学', style: TextStyle(color: Colors.black54)),
                            ),
                            new Container(
                              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                              decoration: new BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Text('论文', style: TextStyle(color: Colors.black54)),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 10),
                        child: new Text(
                          '数学本科论文？',
                          style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 10),
                        child: new Text(
                          '如果没有书籍，那么所有的世界都得自己去拿脚步走一遍才能了解，所有的历史，都只能靠自己挖坟才能了解。还没走完所有的角落，也还没挖完所有的坟，估计生命就要结束了，世界太大，靠脚走生命太短暂，只能靠思想去驰骋',
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 10),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Text('9 人关注'),
                                ),
                                Text('4 条评论')
                              ],
                            ),
                            new FlatButton.icon(
                              onPressed: (){},
                              color: Colors.blue,
                              icon: Icon(Icons.add),
                              label: Text('关注问题'),
                              textColor: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                new Container(
                  decoration: new BoxDecoration(
                    border: new Border(
                      top: new BorderSide(
                        width: 1,
                        color: Colors.grey[200]
                      )
                    )
                  ),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Expanded(
                        flex: 1,
                        child: new Container(
                          child: new FlatButton.icon(
                            onPressed: (){},
                            icon: Icon(Icons.person_add),
                            label: new Text('邀请回答'),
                          ),
                        ),
                      ),
                      new VerticalDivider(
                        width: 1,
                        color: Colors.black,
                      ),
                      new Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey[200],
                      ),
                      new Expanded(
                        flex: 1,
                        child: new Container(
                          child: new FlatButton.icon(
                            onPressed: (){},
                            icon: Icon(Icons.edit),
                            label: new Text('添加回答'),
                          ),
                        )
                      )
                    ],
                  ),
                ),
                
              ],
            ),
          ),

          // option
          new Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 40,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text('1 个回答'),
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        child: new GestureDetector(
                          onTap: () {
                            dynamic state = _menuKey.currentState;
                            state.showButtonMenu();
                          },
                          child: new Container(
                            child: new Text('默认排序'),
                          ),
                        ),
                      ),
                      new PopupMenuButton(
                        icon: Icon(Icons.keyboard_arrow_down),
                        offset: Offset(0, 50),
                        key: _menuKey,
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          new PopupMenuItem<String>(
                              child: const Text('默认排序'), value: 'default'),
                          new PopupMenuItem<String>(
                              child: const Text('按时间排序'), value: 'timeline'),
                        ],
                        onSelected: (_) {}
                      )
                      
                    ],
                  ),
                )
              ],
            ),
          ),

          // 答案
          new Container(
            child: new Column(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 10),
                  color: Colors.white,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      // user avatar & username
                      new Container(
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.only(right: 10),
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  image: NetworkImage('https://pic3.zhimg.com/50/6442141e526ef759fed237ff162bb873_s.jpg'),
                                )
                              ),
                            ),
                            Text('Ludis')
                          ],
                        ),
                      ),

                      // answer contents
                      new Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: new Text(
                          '常听人说，走了这么多路，读了这么多书，还是活不明白。也有人说，读了这么多书，又有什么用呢。不是说，这边读完一本书，那边就马上会有对应的产出。这样把阅读当成饲料的读法，营养也只能是饲料层次的了。书的营养不在于吃，而在于通达，在于心领神会。',
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      // answer response
                      new Container(
                        child: new Text(
                          '19 赞同 ·  24 评论 · 2 小时前',
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}