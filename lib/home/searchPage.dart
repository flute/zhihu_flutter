import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {

  static int _currentTab = 0;
  String _currentTabName = '热榜';
  List<String> _tabNameArr = ['热榜', '影视', '综艺', '职场'];
  List<String> _searchHistory = ['英语', '手机app', '守望先锋士兵', '诺克萨斯之手', 'Amal', '德玛西亚之力', '吃鸡'];
  static List _tabArr = [
    [
      {
        'title': '2018年国家最高科学技术进步奖',
        'desc': '大家都在搜'
      },
      {
        'title': '先天下之忧而忧',
        'desc': '居庙堂之高'
      },
      {
        'title': '后天下之乐而乐',
        'desc': '淫雨霏霏'
      },
      {
        'title': '君不见高堂明镜悲白发',
        'desc': '朝如青丝暮成雪'
      },
      {
        'title': '呱唧啊呱唧',
        'desc': '大家都在搜'
      },
      {
        'title': '庭有枇杷树',
        'desc': '居庙堂之高'
      },
      {
        'title': '吾妻死之年所手植也',
        'desc': '淫雨霏霏'
      },
      {
        'title': '头顶谢公屐',
        'desc': '脚蹬青云梯'
      }
    ],
    [
      {
        'title': '念去去千里烟波'
      },
      {
        'title': '暮霭沉沉楚天阔'
      },
      {
        'title': '争渡争渡惊起一番鸥鹭'
      },
      {
        'title': '不闻机杼声惟闻女叹息'
      }
    ],
    [
      {
        'title': '安得广厦千万间'
      },
      {
        'title': '大批天下寒士俱欢颜'
      },
      {
        'title': '明月松间照'
      },
      {
        'title': '清泉石上流'
      }
    ],
    [
      {
        'title': '哀其不幸'
      },
      {
        'title': '怒其不争'
      },
      {
        'title': '和光同尘'
      },
      {
        'title': '不闻机杼声惟闻女叹息'
      }
    ]
  ];
  List _currentList = _tabArr[_currentTab];

  getShowList(String pos) {
    List<Widget> _leftList = [];
    List<Widget> _rightList = [];
    
    for(var i=0;i<_currentList.length;i++){
      var _item = _currentList[i];
      var _widget = getHotSearchItem(i+1, _item['title'], _item['desc'] != null ? _item['desc'] : '');

      if(pos == 'left' && i%2==0) {
        _leftList.insert(_leftList.length, _widget);
      }else if(pos == 'right' && i%2 != 0){
        _rightList.insert(_rightList.length, _widget);
      }
    }
    return pos == 'left' ? _leftList : _rightList;
  }

  _submitSearch(text) {
    print(text);
    setState(() {
      _searchHistory.insert(0, text);
    });
  }

  _goBack(){
    Navigator.of(context).pop();
  }

  Widget searchInput() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Container(
              height: 36,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.search,
                      color: Colors.black26,
                      size: 20,
                    ),
                  ),

                  new Expanded(
                    child: new TextField(
                      autofocus: true,
                      onSubmitted: _submitSearch,
                      decoration: new InputDecoration.collapsed(
                        hintText: "搜索知乎内容",
                        hintStyle: new TextStyle(color: Colors.black26)
                      ),
                    ),
                  )
                ],
              ),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(Radius.circular(5.0)),
                color: Color.fromRGBO(248, 248, 248, 1)
              ),
            ),
          ),
          
          new Container(
            margin: EdgeInsets.only(left: 15),
            child: new GestureDetector(
              onTap: _goBack,
              child: new Text(
                '取消',
                style: new TextStyle(color: Colors.blue, fontSize: 15),
              ),
            )
          ),
          
        ],
      ),
      
    );
  }

  Widget getTabItem(name) {
    return new Container(
      //margin: EdgeInsets.only(right: 10),
      child: new GestureDetector(
        onTap: (){
          clickTab(name);
        },
        child: Text(
          name,
          style: TextStyle(color: Colors.black87),
        ),
      ),
      // padding: _currentTabName == name ? EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5) : null,
      padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      decoration: new BoxDecoration(
        color: _currentTabName == name ? Colors.grey[200] : null,
        borderRadius: new BorderRadius.all(Radius.circular(15))
      ),
    );
  }

  clickTab(String name){
    print(name);
    setState(() {
      _currentTabName = name;
      _currentTab = _tabNameArr.indexOf(name);
      _currentList = _tabArr[_currentTab];
    });
  }

  
  Widget getHotSearchItem(int index, String title, String desc) {
    bool notNull(Object o) => o != null;
    return new Container(
      margin: EdgeInsets.only(bottom: 20),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(right: 10),
            child: new Text(
              '$index',
              style: TextStyle(fontSize: 16),
            ),
          ),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: new Text(
                    title,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                desc != '' ? new Text(
                  desc,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ) : null
              ].where(notNull).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget hotSearchTag() {
    return new Container(
      padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 20),
      child: new Column(
        children: <Widget>[
          // 热搜、影视、综艺、职场
          new Container(
            margin: EdgeInsets.only(top: 10, bottom: 20),
            child: new Row(
              children: _tabNameArr.map((name) => getTabItem(name)).toList(),
            ),
          ),
          // tag contents

          new Row(
            children: <Widget>[
              new Expanded(
                flex: 1,
                child: new Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: new Column(
                    //children: _currentList.where(test),
                    children: getShowList('left'),
                  ),
                ),
              ),
              new Container(
                width: 10,
              ),
              new Expanded(
                flex: 1,
                child: new Container(
                  child: new Column(
                    children: getShowList('right'),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _removeHistory(int i) {
    setState(() {
      _searchHistory.removeAt(i);      
    });
  }

  Widget _buildRow(String title, int index) {
    //return new Text(title);
    return new Container(
      padding: EdgeInsets.only(left: 5, top: 15, bottom: 15),
      decoration: new BoxDecoration(
        border: Border(
          bottom: new BorderSide(
            width: 1,
            color: Colors.grey[200]
          )
        )
      ),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Row(
              children: <Widget>[
                new Icon(
                  Icons.history,
                  color: Colors.grey[300],
                ),
                new Container(
                  margin: EdgeInsets.only(left: 5),
                  child: new Text(
                    title,
                    style: new TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                )
              ],
            ),
          ),
          new Container(
            child: new GestureDetector(
              onTap: (){_removeHistory(index);},
              child: new Icon(
                Icons.close,
                size: 15,
                color: Colors.black26,
              ),
            )
          )
        ],
      ),
    );
  }

  Widget searchHistory(){
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: new Text(
              '搜索历史',
              style: new TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          new ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(8.0),
            itemCount: _searchHistory.length,
            itemBuilder: (context, i){
              //return Text('entry $i');
              //print(i);
              //return new Text(_searchHistory[i]);
              return _buildRow(_searchHistory[i], i);
            },
          )
          /* new ListView(
            shrinkWrap: true,
            children: <Widget>[
              const Text('I\'m dedicating every day to you'),
              const Text('Domestic life was never quite my style'),
              const Text('When you smile, you knock me out, I fall apart'),
              const Text('And I thought I was so smart'),
            ],
          ) */
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: searchInput(),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            child: new Column(
              children: <Widget>[
                hotSearchTag(),
                searchHistory()
              ],
            ),
          ),
        ),
      ),
    );
  }
}