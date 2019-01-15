import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';

class ColleagueTab extends StatefulWidget {
  @override
  ColleagueTabState createState() => ColleagueTabState();
}

class ColleagueTabState extends State<ColleagueTab> {
  var _jsonData = '';
  ScrollController _controller = new ScrollController();
  bool isPerformingRequest = false; // 是否有请求正在进行
  List<int> items = List.generate(10, (i) => i);

  @override
  void initState() {
    super.initState();
    _fetchData();
    _controller.addListener((){
      if(_controller.position.pixels == _controller.position.maxScrollExtent) {
        print('下拉加载');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _fetchData() async {
    var apiUrl = 'http://v.juhe.cn/toutiao/index?type=top&key=a27aecf7dbae5c7555900e57c8212c46';
    var httpClient = new HttpClient();
    
    var result;
    try {
      var request = await httpClient.getUrl(Uri.parse(apiUrl));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var jsonStr = await response.transform(utf8.decoder).join();
        var data = json.decode(jsonStr);
        result = jsonStr;
        //print(data);
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

    if(result != '') {
      setState(() {
        _jsonData = result;        
      });
    }
    
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = new Completer<Null>();

    new Timer(new Duration(seconds: 3), () {
      print("timer complete");
      completer.complete();
    });

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Http请求'),
      ),
      body: new RefreshIndicator(
        onRefresh: _onRefresh,
        child: new SingleChildScrollView(
          controller: _controller,
          child: new Container(
            padding: EdgeInsets.all(10),
            child: new Column(
              children: <Widget>[
                Text('下拉刷新'),
                new Text(_jsonData)
              ],
            ),
          ),
        ),
      )
    );
  }
}
