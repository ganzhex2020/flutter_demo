import 'package:flutter/material.dart';
import 'package:flutter_demo/bean/Constant.dart';
import 'package:flutter_demo/utils/CommonUtil.dart';
import 'package:flutter_demo/utils/NavigatorUtil.dart';
import 'package:flutter_demo/utils/SpUtil.dart';

import 'CollectPage.dart';
import 'LoginPage.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MinePageState();
}

class _MinePageState extends State<MinePage> {
  String _name;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: new Text("玩安卓"),
      ),
      body: buildContent(),
    );
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() async {
    SpUtils.getString(Constant.spUserName).then((str) {
      setState(() {
        if (str != null) {
          _name = str;
        } else {
          _name = " ";
        }
      });
    });
  }

  Widget buildContent() {
    return new Column(
      children: <Widget>[
        new Container(
            width: CommonUtil.getScreenWidth(context),
            height: 140,
            child: new Center(
                child:
//              new Image.asset(
//                'images/head.jpg',
//                width: 50,
//                height: 50,
//              ),
                    new Column(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(top: 30, bottom: 15),
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('images/head.jpg'),
                    ),
                  ),
                ),
                new Text(
                  _name,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            )),
            decoration: new BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [Colors.blue, Colors.greenAccent],
            ))),
        new GestureDetector(
          child: Container(
            decoration: new BoxDecoration(color: Colors.grey[300]),
            margin:
            EdgeInsets.only(left: 0.0, top: 20.0, right: 0.0, bottom: 0.0),
            padding: EdgeInsets.all(10),
            child: new Row(
              children: <Widget>[
                new Text("我的收藏"),
                new Icon(Icons.keyboard_arrow_right)
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          onTap: () {
//            Fluttertoast.showToast(
//                msg: "敬请期待...",
//                toastLength: Toast.LENGTH_SHORT,
//                gravity: ToastGravity.BOTTOM,
//                timeInSecForIos: 2,
//                backgroundColor: Colors.blue,
//                textColor: Colors.white,
//                fontSize: 16.0);
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new CollectPage()));
          },
        ),
        new GestureDetector(
          child: Container(
            decoration: new BoxDecoration(color: Colors.grey[300]),
            margin:
            EdgeInsets.only(left: 0.0, top: 5.0, right: 0.0, bottom: 0.0),
            padding: EdgeInsets.all(10),
            child: new Row(
              children: <Widget>[
                new Text("关于项目"),
                new Icon(Icons.keyboard_arrow_right)
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          onTap: () {
            NavigatorUtil.toDetails(
                context,
                "https://github.com/ganzhex2020/flutter_demo/blob/master/README.md",
                "玩安卓Flutter版");
          },
        ),
        new GestureDetector(
          child: Container(
            alignment: Alignment(0.0, 0.0),
            margin:
            EdgeInsets.only(left: 0.0, top: 40.0, right: 0.0, bottom: 0.0),
            width: 100,
            height: 40,
            decoration: new BoxDecoration(
                color: Colors.blue,
//              border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(5.0)),
            child: new Text(
              "登录/注册",
              style: new TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          onTap: () {
//            Fluttertoast.showToast(
//                msg: "敬请期待...",
//                toastLength: Toast.LENGTH_SHORT,
//                gravity: ToastGravity.BOTTOM,
//                timeInSecForIos: 2,
//                backgroundColor: Colors.blue,
//                textColor: Colors.white,
//                fontSize: 16.0);
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new LoginPage()));
          },
        )
      ],
    );
  }
}
