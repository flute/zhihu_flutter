import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';

class MessageTab extends StatefulWidget {
  @override
  MessageTabState createState() => MessageTabState();
}

class MessageTabState extends State<MessageTab> {
  var count = 0;
  var list = [1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('消息'),
      ),
      body: Container(
        child: new SingleChildScrollView(
          /* child: LoadMore(
            isFinish: count >= 60,
            onLoadMore: _loadMore,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.blue,
                  child: Text(list[index].toString()),
                  height: 40.0,
                  alignment: Alignment.center,
                );
              },
              itemCount: count,
            ),
          ), */
        )
      ),
    );
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 100));
    load();
    return true;
  }

  load() {
    setState(() {
      for(var i=list.length;i<list.length+10;i++){
        list.insert(i, i);
      }
      count += 10;
    });
  }
}

