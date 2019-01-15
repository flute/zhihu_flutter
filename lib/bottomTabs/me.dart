import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:zh/home/searchPage.dart';

class MeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Container(
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new Container(
                  margin: EdgeInsets.only(right: 20),
                  child: new FlatButton.icon(
                    onPressed: (){
                      Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                        return new SearchPage();
                      }));
                    },
                    color: Colors.grey[100],
                    icon: Icon(Icons.search),
                    label: Text('搜索知乎内容'),
                    textColor: Colors.grey[500],
                  ),
                ),
              ),
              new Container(
                child: new GestureDetector(
                  child: new Icon(
                    Icons.camera_alt,
                    color: Colors.grey[500],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          child: new Column(
            children: <Widget>[
              _meHeader(),
              _myOptions(),
              _options(),
              _setting(),
              _ideas()
            ],
          ),
        ),
      ),
    );
  }

  // 滑动卡片
  _getScrollCard(String title, String desc, String imgUrl) {
    return new Container(
      width: 300,
      height: 100,
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imgUrl)
        )
      ),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title, 
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            child: new Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(255, 255, 255, 0.2)
              ),
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Text(desc, style: TextStyle(color: Colors.white),),
              ),
            )
          )
        ],
      ),
    );
  }

  Widget _ideas() {
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          // header
          new Container(
            padding: EdgeInsets.all(10),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    Icon(Icons.archive, color: Colors.blue,),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text('回答问题', style: TextStyle(fontSize: 16),),
                    )
                  ],
                ),
                new Row(children: <Widget>[
                  Text('更多问题', style: TextStyle(color: Colors.grey[600]),),
                  Icon(Icons.keyboard_arrow_right, color: Colors.grey[400],)
                ],)
              ],
            ),
          ),

          // scrool
          new SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: new Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(bottom: 10),
              child: new Row(
                children: <Widget>[
                  _getScrollCard('你有哪些心中珍藏的好书', '创作PPT视频', 'https://pic3.zhimg.com/80/9518ca360e8de13a86c948f56a13b92e_hd.jpg'),
                  _getScrollCard('一生中有哪些值得看的电影？', '现在开拍', 'https://pic3.zhimg.com/80/7969d765415ba86f90994439b1be5c9e_hd.jpg'),
                  _getScrollCard('你拍过最满意的视频是什么？', '创作开拍', 'https://pic2.zhimg.com/80/cc46451cc9621b625f32f60d81fc7965_hd.jpg'),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  Widget _optionsItem(int index, String title) {
    final i = index+1;
    return new Expanded(
      flex: 1,
      child: new Container(
        child: Column(
          children: <Widget>[
            new Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage('assets/icon/$i.png')
                )
              ),
            ),
            Text(title, style: TextStyle(fontSize: 13),)
          ],
        ),
      )
    );
  }

  Widget _setting() {
    var optionText = ['社区建设', '反馈与帮助', '夜间模式', '设置'];
    List<Widget> options = [];

    for(var i=0;i<optionText.length;i++){
      options.insert(options.length, _optionsItem(i+8, optionText[i]));
    }
    return new Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: options,
      ),
    );
  }

  Widget _options() {
    var optionText = ['学习记录', '已购', '余额礼券', '我的Live', '我的书架', '下载中心', '付费咨询', '活动广场'];
    List<Widget> firstLine = [];
    List<Widget> secondLine = [];
    for(var i=0;i<optionText.length;i++){
      if(i%2==0){
        firstLine.insert(firstLine.length, _optionsItem(i, optionText[i]));
      }else{
        secondLine.insert(secondLine.length, _optionsItem(i, optionText[i]));
      }
    }
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: new Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: firstLine,
            ),
          ),
          new Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: secondLine,
            ),
          )
        ],
      ),
    );
  }

  Widget _myOptions() {
    final style1 = TextStyle(fontSize: 18, color: Colors.black);
    final style2 = TextStyle(fontSize: 13, color: Colors.black87);

    return new Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Expanded(
            child: new Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Text('9', style: style1),
                  Container(
                    child: Text('我的创作', style: style2),
                  ),
                  Text('1草稿', style: TextStyle(fontSize: 10, color: Colors.black45),),
                ],
              ),
            ),
          ),
          new VerticalDivider(
            width: 1,
            color: Colors.red,
          ),
          new Expanded(
            child: new Container(
              child: Column(
                children: <Widget>[
                  Text('672', style: style1,),
                  Container(
                    child: Text('关注', style: style2,),
                  )
                ],
              ),
            ),
          ),

          new Expanded(
            child: new Container(
              child: Column(
                children: <Widget>[
                  Text('29', style: style1,),
                  Container(
                    child: Text('收藏夹', style: style2,),
                  )
                ],
              ),
            ),
          ),

          new Expanded(
            child: new Container(
              child: Column(
                children: <Widget>[
                  Text('30', style: style1,),
                  Container(
                    child: Text('最近浏览', style: style2,),
                  )
                ],
              ),
            )
          )

        ],
      ),
    );
  }

  Widget _meHeader() {
    return new Container(
      padding: EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 10),
      color: Colors.black54,
      child: new Row(
        children: <Widget>[

          // 头像
          new Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.only(right: 15),
            decoration: new BoxDecoration(
              border: Border.all(width: 2, color: Colors.white),
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://pic2.zhimg.com/v2-5193fd037765a487a0496b90eccfc395_im.jpg'),
              )
            ),
          ),

          // 信息
          new Expanded(
            child: new Container(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'ludis master',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  new Container(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          padding: EdgeInsets.all(3),
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: new Row(children: <Widget>[
                            Icon(Icons.favorite, size: 10, color: Colors.blue),
                            Container(
                              margin: EdgeInsets.only(left: 5, right: 5),
                              child: Text('知乎颜值 : 418', style: TextStyle(color: Colors.white, fontSize: 10),),
                            ),
                            Icon(Icons.keyboard_arrow_right, size: 15, color: Colors.white)
                          ],),
                        ),
                        Icon(Icons.file_upload, size: 15, color: Colors.white)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          // 个人主页
          new Container(
            child: new Row(
              children: <Widget>[
                new Container(
                  child: Text('个人主页', style: TextStyle(color: Colors.white, fontSize: 13)),
                ),
                Icon(Icons.keyboard_arrow_right, color: Colors.grey[300], size: 20,)
              ],
            ),
          )

        ],
      ),
    );
  }
}
