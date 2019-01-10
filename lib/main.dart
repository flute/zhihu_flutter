import 'package:flutter/material.dart';
import 'package:zh/bottomTabs/home.dart';
import 'package:zh/bottomTabs/idea.dart';
import 'package:zh/bottomTabs/colleague.dart';
import 'package:zh/bottomTabs/message.dart';
import 'package:zh/bottomTabs/me.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

/* void main(){ runApp(new MaterialApp(
    title: '233',
    home: new HomePage(),
  ));
} */

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

// singleTickerProviderStateMixin is used for animation
class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  // create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // initialize the tab controller
    // vsync ??
    controller = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // dispose of tab controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /* appBar: new AppBar(
        title: new Text('Bottom Tabbar'),
        backgroundColor: Colors.blue,
      ), */
      body: new TabBarView(
        children: <Widget>[new HomeTab(), new IdeaTab(), new ColleagueTab(), new MessageTab(), new MeTab()],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        // background color of bottom navigation bar
        color: Colors.white,
        textStyle: new TextStyle(
          color: Colors.black45
        ),
        child: new TabBar(
          unselectedLabelColor: Colors.black45,
          labelColor: Colors.blue,
          controller: controller,
          tabs: <Tab>[
            new Tab(
              icon: new Icon(Icons.ac_unit),
              text: '首页',
            ),
            new Tab(
              icon: new Icon(Icons.access_alarm),
              text: '想法',
            ),
            new Tab(
              icon: new Icon(Icons.access_time),
              text: '大学'
            ),
            new Tab(
              icon: new Icon(Icons.account_balance_wallet),
              text: '消息',
            ),
            new Tab(
              icon: new Icon(Icons.adb),
              text: '我的',
            ),
          ],
        ),
      ),
    );
  }

}
