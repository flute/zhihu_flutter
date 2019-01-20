import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ColleagueTab extends StatefulWidget {
  @override
  ColleagueTabState createState() => ColleagueTabState();
}

class ColleagueTabState extends State<ColleagueTab> {
  var _jsonData = [];
  var pageToken = '1';
  ScrollController _controller = new ScrollController();
  //bool isPerformingRequest = false; // 是否有请求正在进

  @override
  void initState() {
    super.initState();
    _fetchData();
    _controller.addListener((){
      if(_controller.position.pixels >= _controller.position.maxScrollExtent - 100) {
        print('上拉加载');
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _fetchData() async {
    var apiUrl = 'http://api01.idataapi.cn:8000/news/qihoo?kw=apple&site=qq.com&pageToken=$pageToken&apikey=MuvrJD7Pk1Wv0fw1Yz306oMGbXP39VxWR7btRuU9fQMvcyfcE75H37yngAT74bPd';
    print(apiUrl);
    var httpClient = new HttpClient();
    
    var result;
    try {
      var request = await httpClient.getUrl(Uri.parse(apiUrl));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var jsonStr = await response.transform(utf8.decoder).join();
        var data = json.decode(jsonStr);
        result = data;
        // print(data);
      } else {
        print('response statusCode not equal 200');
      }
    } catch (exception) {
      print('fetch data error: $exception');
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    if(result!=null) {
      print('loading success');
      setState(() {
        
        if(pageToken == '1'){
          // 下拉刷新
          _jsonData = result['data'];
        }else{
          // 上拉加载
          _jsonData = new List.from(_jsonData)..addAll(result['data']);
        }
        pageToken = result['pageToken'];     
      });
    }
    
  }

  // 下拉刷新
  Future<Null> _onRefresh() async {
    Completer<Null> completer = new Completer<Null>();

    /* new Timer(new Duration(seconds: 3), () {
      print("timer complete");
      completer.complete();
    }); */
    setState(() {
      pageToken = '1';      
    });
    var _ = await _fetchData();
    completer.complete();

    return completer.future;
  }

  Widget _getMoreLoading() {
    return new Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new CircularProgressIndicator(strokeWidth: 3, backgroundColor: Colors.blue[300])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('网络请求-下拉上滑-左右滑动-长按'),
      ),
      body: new RefreshIndicator(
        onRefresh: _onRefresh,
        child: new ListView.builder(
          controller: _controller,
          itemCount: _jsonData.length + 1,
          itemBuilder: (context, i){
            //return new Text('$i');
            if(i == _jsonData.length) return _getMoreLoading();
            return new Container(
              //padding: EdgeInsets.only(left: 10, right: 10),
              height: 80,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.grey[200]
                  )
                )
              ),
              
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _swipe(i+1, _jsonData[i]['title'], _jsonData[i]['posterScreenName'])
                  /* Text(
                    '${i+1} . '+_jsonData[i]['title'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  Text(
                    _jsonData[i]['posterScreenName'],
                    style: TextStyle(color: Colors.blue[300]),
                  ) */
                ],
              ),
              
            );
          },
        )
      )
    );
  }

  void _showSnackBar(String title) {
    Scaffold.of(context).showSnackBar(
      SnackBar(content: Text(title))
    );
  }

void _showToast(String title) {
  Fluttertoast.showToast(
    msg: title,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIos: 1,
    backgroundColor: Color.fromRGBO(0, 0, 0, 0.85),
    textColor: Colors.white
  );
}

  // 左右滑动
  Widget _swipe(int i, String title, String desc) {
    return new Slidable(
      delegate: new SlidableDrawerDelegate(),
      actionExtentRatio: 0.25,
      child: new Container(
        color: Colors.white,
        child: new GestureDetector(
          onTap: (){_showToast('点击: $i');},
          onDoubleTap: (){_showToast('连点: $i');},
          onLongPress: (){_showToast('长按: $i');},
          child: new ListTile(
            leading: new CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: new Text(
                '$i',
                style: TextStyle(color: Colors.orange),
              ),
              foregroundColor: Colors.white,
            ),
            title: new Text(
              '$title',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
            subtitle: new Text(
              '$desc',
              style: TextStyle(color: Colors.blue[300]),
            ),
          ),
        )
      ),
      actions: <Widget>[
        new IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () => _showSnackBar('Archive'),
        ),
        new IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () => _showSnackBar('Share'),
        ),
      ],
      secondaryActions: <Widget>[
        new IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => _showSnackBar('More'),
        ),
        new IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => _showSnackBar('Delete'),
        ),
      ],
    );
  }
}
