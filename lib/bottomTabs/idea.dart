import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class IdeaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // backgroundColor: Colors.red,
      appBar: new AppBar(
        title: new Text('想法'),
      ),
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Container(
              height: 200,
              child: new _Swiper(),
            ),
            new Expanded(
              child: new Center(
                child: Container(
                  child: Text('想法'),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          _showDialog(context);
        },
        child: Icon(Icons.edit),
        //mini: true,
      ),
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class _Swiper extends StatefulWidget {
  @override
  _SwiperState createState() => _SwiperState();
}

var images = [
  'https://pic3.zhimg.com/v2-5806d9e33e36fa772c8da56c931bb416_b.jpg',
  'https://pic1.zhimg.com/50/v2-f355ca177e011626938b479f0e2e3e03_hd.jpg',
  'https://pic2.zhimg.com/v2-d8e47ed961b93b875ad814104016bdfd_b.jpg'
];

class _SwiperState extends State<_Swiper> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Swiper(
        itemBuilder: (BuildContext context,int index){
          return new Image.network(images[index], fit: BoxFit.cover,);
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );

  }
}