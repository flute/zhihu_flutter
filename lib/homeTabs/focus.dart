import 'package:flutter/material.dart';

class Focus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
        color: Color.fromRGBO(248, 248, 248, 1.0),
        child: new Column(
          children: <Widget>[
            // 发现更多感兴趣的人
            new GestureDetector(
              onTap: (){
                print('233');
              },
              child: new Container(
                height: 60,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(left: 10, right: 10),
                color: Colors.white,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Text('发现更多感兴趣的人'),
                    ),
                    new Container(
                      height: 60,
                      alignment: Alignment.centerRight,
                      transform: Matrix4.translationValues(45.0, 0.0, 0.0),
                      child: new Row(
                        children: <Widget>[
                          getUserAvatar('https://pic3.zhimg.com/50/d2af1b6b1_s.jpg', 0),
                          getUserAvatar('https://pic3.zhimg.com/50/d2af1b6b1_s.jpg', 15),
                          getUserAvatar('https://pic2.zhimg.com/88cf6915dfe0f1dc80191f1e07495c6b_s.jpg', 30),
                          getUserAvatar('https://pic2.zhimg.com/v2-46f3d48ddc43893e97815e8d0b1b83fd_s.jpg', 45),
                        ],
                      ),
                    ),
                    new Icon(Icons.chevron_right)
                  ],
                ),
              ),
            ),
            
            // 列表item
            new Column(
              children: <Widget>[
                getListItem(
                  'https://pic1.zhimg.com/v2-16f69e0278cb3ad5073a88b50f1f0468_is.jpg',
                  '鹿哥',
                  '23',
                  1,
                  '在婴幼儿成长过程中有哪些容易吧诶家长忽视的问题？',
                  '事情的经过是这样的。 一天疲劳后回家，灰头土脸，他说给我一个惊喜，他挑了很久，觉得好看，相信我也很喜欢的礼物。 我看到是口红的时候，还真的蛮开心的，打开后我笑出了声。微笑着流泪。 死亡芭比粉，它有',
                  28,
                  1,
                  ''
                ),
                getListItem(
                  'https://pic3.zhimg.com/50/fdb8a75e59db51fd9d77bdf238f6ee9b_s.jpg',
                  '鹿哥',
                  '50',
                  2,
                  '北京有什么鲜为人知的、很好玩的地方？',
                  'DC-非凡大陆： 来，我给你们推荐个不一样的。 密室。 我不务正业的爱好之一就是玩密室，几年时间大概也玩了不下一百个，虽然比不上一些极致发烧友，但好歹我都…',
                  302,
                  32,
                  ''
                ),
                getListItem(
                  'https://pic3.zhimg.com/50/fdb8a75e59db51fd9d77bdf238f6ee9b_s.jpg',
                  '鹿哥',
                  '50',
                  2,
                  '北京有什么鲜为人知的、很好玩的地方？',
                  'DC-非凡大陆： 来，我给你们推荐个不一样的。 密室。 我不务正业的爱好之一就是玩密室，几年时间大概也玩了不下一百个，虽然比不上一些极致发烧友，但好歹我都…',
                  302,
                  32,
                  'https://pic2.zhimg.com/v2-2369a8ba607ae413c0f03b5ed9eded29_400x224.jpeg'
                ),
                getListItem(
                  'https://pic1.zhimg.com/v2-16f69e0278cb3ad5073a88b50f1f0468_is.jpg',
                  '鹿哥',
                  '23',
                  1,
                  '在婴幼儿成长过程中有哪些容易吧诶家长忽视的问题？',
                  '事情的经过是这样的。 一天疲劳后回家，灰头土脸，他说给我一个惊喜，他挑了很久，觉得好看，相信我也很喜欢的礼物。 我看到是口红的时候，还真的蛮开心的，打开后我笑出了声。微笑着流泪。 死亡芭比粉，它有',
                  28,
                  1,
                  ''
                ),
              ],
            )
            // 文章item
            
          ],
        ),
      ),
    );

  }

  /**
   * 获取列表项目
   * type 1: 回答了； 2: 赞同了
   */
  getListItem(String avatarUrl, String userName, String time, int type, String title, String content, int like, int comment, String imgUrl) {
    String itemInfo = type == 1 ? '$userName回答了问题 · $time分钟前' : '$userName赞同了问题 · $time分钟前';
    String bottomInfo = type == 1 ? '$like 赞同' : '$like 赞同 · $comment 评论';
    bool notNull(Object o) => o != null;

    return new Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 10),
      child: new Column(
        children: <Widget>[
          // 头部
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Row(children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 5),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    image: new NetworkImage(avatarUrl),
                  )
                ),
                width: 30,
                height: 30,
              ),
              
              Text(
                itemInfo,
                style: TextStyle(color: Colors.black45, fontSize: 14),
              ),
            ]),
          ),

          // 标题
          Container(
            margin: EdgeInsets.only(bottom: 5),
            alignment: Alignment.centerLeft,
            child: new Text(
              title,
              style: new TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),

          // 内容
          Container(
            child: Row(
              children: <Widget>[
                new Expanded(
                  child: Text(
                    content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
                imgUrl != '' ? Container(
                  width: 100,
                  height: 60,
                  margin: EdgeInsets.only(left: 10),
                  child: new Image.network(imgUrl),
                ) : null,
              ].where(notNull).toList(),
            ),
          ),

          // 底部
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(children: <Widget>[
              Text(
                bottomInfo,
                style: TextStyle(color: Colors.black38),
              )
            ],)
          ),
          
        ]
        
      ),
    );
  }

  // 更多感兴趣的人 返回头像
  getUserAvatar(String avatarUrl, double float) {
    return Container(
      width: 40,
      height:40,
      // flutter中的margin没有负值的说法
      // https://stackoverflow.com/questions/42257668/the-equivalent-of-wrap-content-and-match-parent-in-flutter
      transform: Matrix4.translationValues(-float, 0.0, 0.0),
      decoration: new BoxDecoration(
        border: Border.all(width: 3, color: Colors.white),
        color: Colors.black,
        shape: BoxShape.circle,
        image: new DecorationImage(
          image: new NetworkImage(avatarUrl)
        )
      ),
    );
  }
}