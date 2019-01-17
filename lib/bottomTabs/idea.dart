import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/cupertino.dart';

class IdeaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // backgroundColor: Colors.red,
      appBar: new AppBar(
        title: new Text('想法'),
      ),
      body: IdeaPage(),
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

class IdeaPage extends StatefulWidget {
  @override
  IdeaPageState createState() => IdeaPageState();
}

class IdeaPageState extends State<IdeaPage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _name;
  String _color;
  String _config;
  String radio;
  bool flutter = false;
  bool rn = true;
  String _number;
  double _slider = 0.0;
  DateTime _dateTime = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  void _onSubmit() {
    final form = _formKey.currentState;
    if(form.validate()) {
      form.save();
      showDialog(context: context, builder: (ctx)=> new AlertDialog(
        content:  new Text('$_name $_color $_config'),
      ));
    }
  }

  Widget devider(String title) {
    return new Container(
      padding: EdgeInsets.only(left:5, top: 10, bottom: 10),
      decoration: new BoxDecoration(
        color: Colors.blueGrey[100],
        border: new Border(
          left: BorderSide(
            width: 5,
            color: Colors.purple
          )
        )
      ),
      
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: new Text(title, style: TextStyle(color: Colors.teal, fontSize: 16),),
    );
  }

  void _showDatePicker() {
    _selectDate(context);
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime _picked = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: new DateTime(2016),
      lastDate: new DateTime(2050)
    );

    if(_picked != null) {
      print(_picked);
      setState(() {
        _dateTime = _picked;
      });
    }
  }

  void _showTimePicker(){
    _selectTime(context);
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay _picker = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if(_picker != null) {
      print(_picker);
      setState(() {
        _time = _picker;
      });
    }
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
          label: 'UNDO', 
          onPressed: scaffold.hideCurrentSnackBar
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Container(
              height: 200,
              child: new _Swiper(),
            ),
            new Flexible(
              flex: 1,
              child: new Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: new Column(
                  
                  children: <Widget>[
                    new Form(
                      key: _formKey,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[

                          devider('输入框：'),
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: '名称'
                            ),
                            onSaved: (val) => this._name = val,
                            validator: (val) => (val == null || val.isEmpty) ? "请输入商品名称": null,
                          ),
                          new TextFormField(
                            maxLength: 32,
                            onSaved: (val)=> this._config = val,
                            validator: (v)=>(v == null || v.isEmpty)?"请选择配置": null,
                            decoration: new InputDecoration(
                              labelText: '配置',
                            ),
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.number,
                            onSaved: (val)=> this._number = val,
                            decoration: new InputDecoration(
                              labelText: 'number',
                            ),
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.datetime,
                            onSaved: (val)=> this._number = val,
                            decoration: new InputDecoration(
                              labelText: 'datetime',
                            ),
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (val)=> this._number = val,
                            decoration: new InputDecoration(
                              labelText: 'emailAddress',
                            ),
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.phone,
                            onSaved: (val)=> this._number = val,
                            decoration: new InputDecoration(
                              labelText: 'phone',
                            ),
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.url,
                            onSaved: (val)=> this._number = val,
                            decoration: new InputDecoration(
                              labelText: 'url',
                            ),
                          ),
                          new TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            maxLength: 100,
                            decoration: new InputDecoration(
                              labelText: '多行输入',
                            ),
                          ),

                          devider('Radio单选按钮：'),
                          new Row(
                            children: <Widget>[
                              new Radio(
                                groupValue: this.radio,
                                activeColor: Colors.blue,
                                value: 'aaa',
                                onChanged: (String val) {
                                  // val 与 value 的类型对应
                                  this.setState(() {
                                    this.radio = val;  // aaa
                                  });
                                },
                              ),
                              new Text('male'),
                              new Radio(
                                groupValue: this.radio,
                                activeColor: Colors.blue,
                                value: 'bbb',
                                onChanged: (String val) {
                                  // val 与 value 的类型对应
                                  this.setState(() {
                                    this.radio = val;  // aaa
                                  });
                                },
                              ),
                              new Text('female'),
                              new Radio(
                                groupValue: this.radio,
                                activeColor: Colors.blue,
                                value: 'unknown',
                                onChanged: (String val) {
                                  // val 与 value 的类型对应
                                  this.setState(() {
                                    this.radio = val;  // aaa
                                  });
                                },
                              ),
                              new Text('unknown'),
                            ],
                          ),

                          devider('复选 CheckBox：'),
                          new Row(
                            children: <Widget>[
                              new Checkbox(
                                value: rn,
                                activeColor: Colors.blue,
                                onChanged: (val) {
                                  setState(() {
                                    rn = val;
                                  });
                                },
                              ),
                              Text('Flutter'),
                              new Checkbox(
                                value: flutter,
                                activeColor: Colors.blue,
                                onChanged: (val) {
                                  setState(() {
                                    flutter = val;
                                  });
                                },
                              ),
                              Text('React Native')
                            ],
                          ),
                          devider('switch:'),
                          new Container(
                            child: new Switch(
                              activeColor: Colors.green,
                              value: flutter,
                              onChanged: (val) {
                                setState(() {
                                  flutter = val;
                                });
                              },
                            ),
                          ),
                          devider('slider:'),
                          new Slider(
                            value: _slider,
                            min: 0.0,
                            max: 100.0,
                            onChanged: (val) {
                              setState(() {
                                _slider = val;
                              });
                            },
                          ),
                          devider('Datepicker'),
                          new GestureDetector(
                            onTap: (){
                              _showDatePicker();
                            },
                            child: new Container(
                              child: new Text(_dateTime.toLocal().toString()),
                            ),
                          ),
                          devider('Timepicker'),
                          new GestureDetector(
                            onTap: _showTimePicker,
                            child: new Text(_time.format(context)),
                          ),
                          devider('Datepicker_custom'),
                          new GestureDetector(
                            onTap: _showTimePicker,
                            child: new Text(_time.format(context)),
                          ),
                          new Container(
                            margin: EdgeInsets.only(top: 50),
                            child: new MaterialButton(
                              child: new Text(
                                'Submit', 
                                style: const TextStyle(color: Colors.white),
                              ),
                              onPressed: _onSubmit, 
                              color: Theme.of(context).primaryColor,
                            ),
                          ),

                          devider('showSnackBar/Toast:'),
                          new MaterialButton(
                            onPressed: () {
                              _showToast(context);
                            },
                            child: new Text('showSnackBar', style: TextStyle(color: Colors.white),),
                            color: Colors.greenAccent,
                          ),

                          new CupertinoActionSheet(
                            title: new Text('title'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}