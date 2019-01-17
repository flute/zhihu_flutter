import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';

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
        title: new Text('网络请求、下拉、上滑'),
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
              padding: EdgeInsets.only(left: 10, right: 10),
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
                  Text(
                    '${i+1} . '+_jsonData[i]['title'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  Text(
                    _jsonData[i]['posterScreenName'],
                    style: TextStyle(color: Colors.blue[300]),
                  )
                ],
              ),
              
            );
          },
        ),
        /* child: new SingleChildScrollView(
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
        ), */
      )
    );
  }
}
