import 'package:flutter/material.dart';

/* class Hot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.favorite,
              size: 160.0,
              color: Colors.red,
            ),
            new Text("First Tab")
          ],
        ),
      ),
    );
  }
} */


class Hot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: new Container(
        color: Color.fromRGBO(248, 248, 248, 1),
        padding: EdgeInsets.only(top: 10),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            getHotItem(
              1,
              '机关老处长：这年头，找个靠谱的年轻人太难了',
              247,
              'https://pic2.zhimg.com/50/v2-bf8e8ddf4f2b76b1935b224237b345a2_400x224.png',
              '这几年我带过几个小年轻，基础都很好，脑子活、上手快，能说会道，可总觉得哪里差点劲儿，让人不放心、不托底。'
            ),
            getHotItem(
              2,
              '机关老处长：这年头，找个靠谱的年轻人太难了',
              247,
              'https://pic2.zhimg.com/50/v2-bf8e8ddf4f2b76b1935b224237b345a2_400x224.png',
              ''
            ),
            getHotItem(
              3,
              '机关老处长：这年头，找个靠谱的年轻人太难了',
              247,
              'https://pic2.zhimg.com/50/v2-bf8e8ddf4f2b76b1935b224237b345a2_400x224.png',
              ''
            ),
            getHotItem(
              4,
              '机关老处长：这年头，找个靠谱的年轻人太难了',
              247,
              'https://pic2.zhimg.com/50/v2-bf8e8ddf4f2b76b1935b224237b345a2_400x224.png',
              '这几年我带过几个小年轻，基础都很好，脑子活、上手快，能说会道，可总觉得哪里差点劲儿，让人不放心、不托底。'
            ),
            getHotItem(
              5,
              '机关老处长：这年头，找个靠谱的年轻人太难了',
              247,
              'https://pic2.zhimg.com/50/v2-bf8e8ddf4f2b76b1935b224237b345a2_400x224.png',
              ''
            ),
            getHotItem(
              6,
              '机关老处长：这年头，找个靠谱的年轻人太难了',
              247,
              'https://pic2.zhimg.com/50/v2-bf8e8ddf4f2b76b1935b224237b345a2_400x224.png',
              ''
            ),
            

          ],
        ),
      ),
      
    );
  }

  /**
   * 获取热榜的子项
   */
  getHotItem(int index, String title, int hotNum, String coverImg, String content) {
    bool notNull(Object o) => o != null;
    
    return new Container(
      padding: EdgeInsets.all(10),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          bottom: new BorderSide(
            color: Colors.black12,
            width: 1
          )
        )
      ),
      child: IntrinsicHeight(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 热榜编号
            new Container(
              
              child: new Text(
                '$index',
                style: new TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            
            // 热榜内容
            new Expanded(
              child: new Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10, right: 10),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // 标题
                    new Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: new Text(
                        title,
                        style: new TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    // 简介
                    content != '' ? new Container(
                      // margin: EdgeInsets.only(bottom: 5),
                      child: new Text(
                        content,
                        style: new TextStyle(color: Colors.black54, fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ) : null,

                    // 热度
                    new Container(
                      margin: EdgeInsets.only(top: 5),
                      child: new Text(
                        '247 万热度',
                        style: new TextStyle(fontSize: 16, color: Colors.black38),
                      ),
                    )
                  ].where(notNull).toList(),
                ),
              ),
            ),
            
            
            // 热榜图片
            new Container(
              width: 120,
              height: 80,
              // constraints: BoxConstraints(maxHeight: 80.0),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                image: new DecorationImage(
                  image: NetworkImage(coverImg),
                  fit: BoxFit.fill
                )
              ),
            ),

          ],
        ),
      ),
      
    );
  }
}
