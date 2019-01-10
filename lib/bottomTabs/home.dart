import 'package:flutter/material.dart';
import 'package:zh/homeTabs/focus.dart';
import 'package:zh/homeTabs/recommend.dart';
import 'package:zh/homeTabs/hot.dart';
import 'package:zh/homeTabs/video.dart';
import 'package:zh/home/searchPage.dart';
import 'package:zh/home/askPage.dart';

class HomeTab extends StatefulWidget {
  @override
  HomeTabState createState() => HomeTabState();
}

class HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  TabBar gettabBar() {
    return new TabBar(
      unselectedLabelColor: Colors.black38,
      labelColor: Colors.black87,
      indicatorColor: Colors.black87,
      tabs: <Widget>[
        new Tab(text: '关注'),
        new Tab(text: '推荐'),
        new Tab(text: '热榜'),
        new Tab(text: '视频'),
      ],
      controller: _controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return new TabBarView(
      children: tabs,
      controller: _controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: searchBar(),
        backgroundColor: Colors.white,
        bottom: gettabBar(),
      ),
      body: getTabBarView(<Widget>[new Focus(), new Recommend(), new Hot(), new Video()]),
    );
  }

  /**
   * 顶部搜索栏
   */
  Widget searchBar() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new FlatButton.icon(
              color:Color.fromRGBO(229, 229, 229, 1.0),
              onPressed: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                  return new SearchPage();
                }));
              },
              icon: new Icon(
                Icons.search,
                color: Colors.black38,
                size: 16.0,
              ),
              label: new Text(
                "诺奖得主为上课推迟发布会",
                style: new TextStyle(color: Colors.black38)
              ),
            ),
          ),
          new Container(
            child: new FlatButton.icon(
              onPressed: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                  return new AskPage();
                }));
              },
              icon: new Icon(
                Icons.border_color,
                color: Colors.blue,
                size: 14.0
              ),
              label: new Text(
                '提问',
                style: new TextStyle(color: Colors.blue),
              ),
            ),
          )
        ],
      ),
    );
  }

}
