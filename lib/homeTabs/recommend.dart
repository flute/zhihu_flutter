import 'package:flutter/material.dart';

class Recommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
        color: Color.fromRGBO(248, 248, 248, 1),
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            getRecommendItem(
              '六脉神剑和一阳指有什么区别？',
              '这位凌驾江湖数十年的高手的死，被灵鹫宫隐瞒的很好，在当时并没有被外界知晓。不过迹象还是慢慢显露出来，灵鹫宫治下的三十六洞七十二岛，最开始出现乱的苗条。后来连灵鹫宫也显出群龙无首的迹象，无力控制江湖的局面。',
              4629,
              497,
              'https://pic3.zhimg.com/50/v2-f9fd4b13a46f2800a7049a5724e5969f_400x224.jpg',
            ),
            getRecommendItem(
              '女生太好追，男生是不是就不会珍惜了?',
              '如果追上，生活在一起之后，那些幻象消失，男生往往会陷入一种很矛盾的状态，想起往事，心潮澎湃，看着眼前的这个人，心态却越来越平静，有时候甚至都恍惚这两个女生到底是不是一个人。如果该女生不能提供新的吸引点，男生会越来越失望，很多追到女神的男生都会经历这个过程。',
              4629,
              497,
              '',
            ),
            getRecommendItem(
              '为什么用英语能够表达出母语难以启齿的事？',
              '很多女生容易遇上渣男就是主观感受太强，只看到表象觉得他条件不错又对自己挺好的，而对其他方面都选择性忽略，比如这个男生对父母很不尊重，在朋友面前喜欢说谎吹牛，对服务员嚣张跋扈，遇到矛盾全怪他人从不自我反思，唯利是图贪小便宜……女生可能会觉得这些都跟自己没关系，只要他对我好就行了。',
              4629,
              497,
              '',
            ),

          ],
        ),
      ),
    );

  }

  getRecommendItem(String title, String content, int like, int comment, String coverUrl) {
    bool notNull(Object o) => o != null;

    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top: 5, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // 标题
          new Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.only(top: 5, bottom: 10),
            //color: Colors.red,
            child: new Text(
              title,
              style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),

          // 图片
          coverUrl != '' ? new Container(
            height: 200,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: NetworkImage(coverUrl),
                fit: BoxFit.cover
              )
            ),
          ) : null,

          // 内容
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.only(top: 5, bottom: 5),
            child: new Text(
              content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),

          // 底部信息
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: new Text(
              '$like 赞同 · $comment 评论',
              style: TextStyle(color: Colors.black38, fontSize: 14),
            ),
          )
        ].where(notNull).toList(),
      ),
    );
  }
}