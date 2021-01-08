import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_demo/bean/Api.dart';
import 'package:flutter_demo/bean/hot_friend_bean.dart';
import 'package:flutter_demo/bean/hot_key_bean.dart';
import 'package:flutter_demo/utils/HttpUtil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'DetailsPage.dart';
import 'SearchResultPage.dart';

class HotSearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HotSearchPageState();
}

class _HotSearchPageState extends State<HotSearchPage> {
  final controller = TextEditingController();
  bool isLoading = true;

  List<HotKey> hotKeyList;
  List<HotFriend> hotFriendList;
  List<Color> colors = [
    Colors.blue,
    Colors.deepOrange,
    Colors.amber,
    Colors.pink[200],
    Colors.green,
    Colors.purple,
    Colors.pink,
    Colors.teal
  ];
  final random = new Random();

  int randomNum() {
    return random.nextInt(7);
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    getList();
  }

  void getList() async {
    var response = await new HttpUtil().get(Api.HOT_WORD);
    var item = new HotKeyBean.fromJson(response);
    var response1 = await new HttpUtil().get(Api.HOT_FRIEND);
    var item1 = new HotFriendBean.fromJson(response1);
    setState(() {
      isLoading = false;
      hotKeyList = item.data;
      hotFriendList = item1.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: new Text("玩安卓"),
      ),
      body: buildCustomScrollView(),
    );
  }

  Widget buildCustomScrollView() {
    return isLoading
        ? SpinKitCircle(
            itemBuilder: (_, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey,
                ),
              );
            },
          )
        : new Container(
            child: new ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return buildSearch();
                  } else if (index == 1) {
                    return buildTitle("大家都在搜");
//                return buildList(homeList[index - headerCount]);
                  } else if (index == 2) {
                    return buildKeyList();
                  } else if (index == 3) {
                    return buildTitle("常用网站");
                  } else  {
                    return buildFriendList();
                  }
                }));
  }

  Widget buildSearch() {
    return new Container(
      padding: EdgeInsets.only(left: 5.0, top: 3.0, right: 5.0, bottom: 2.0),
      width: 200,
      height: 50,
      child: new Row(
        // spacing: 100,
        children: [
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 40, maxWidth: 300),
              child: TextField(
                controller: controller,
                cursorColor: Colors.grey, // 光标颜色
                // 默认设置
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    border: new OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: "输入关键字搜索",
                    hintStyle: new TextStyle(
                        fontSize: 14, color: Color.fromARGB(50, 0, 0, 0))),
                style: new TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            flex: 3,
          ),
          SizedBox(width: 10), // 10宽度/ use Spacer
          Expanded(
            child: FlatButton(

                // padding: EdgeInsets.only(left: 5.0, top: 3.0, right: 5.0, bottom: 2.0),
                // padding: EdgeInsets.all(0),
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("搜索"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () => {
                      //  NavigatorUtil.toSearchResult(context, controller.text)
                    }),
            flex: 1,
          ),
        ],
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }

  Widget buildTitle(String title) {
    return new Container(
      padding: EdgeInsets.only(left: 10.0, top: 5.0),
      child: new Text(title,
          textAlign: TextAlign.left,
          style: new TextStyle(color: Colors.black, fontSize: 16)),
    );
  }

  Widget buildKeyList() {
    return new Container(
        decoration: new BoxDecoration(color: Colors.grey[300]),
        margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 2.0, top: 2.0),
        padding: EdgeInsets.all(5.0),
        child: new Wrap(
          children: hotKeyList.map((item) {
            return new GestureDetector(
                child: Container(
                    decoration: new BoxDecoration(
                        color: colors[randomNum()],
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 5.0, top: 5.0),
                    margin: EdgeInsets.only(
                        left: 5.0, right: 5.0, bottom: 5.0, top: 5.0),
                    child: Text(item.name,
                        style: new TextStyle(
                            color: Colors.white, fontSize: 16.0))),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new SearchResultPage(item.name))
                  );
                });
          }).toList(),
        ));
  }

  Widget buildFriendList() {
    return new Container(
        decoration: new BoxDecoration(color: Colors.grey[300]),
        margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 2.0, top: 2.0),
        padding: EdgeInsets.all(5.0),
        child: new Wrap(
          children: hotFriendList.map((item) {
            return new GestureDetector(
                child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
                    margin: EdgeInsets.only(
                        left: 5.0, right: 5.0, bottom: 5.0, top: 5.0),
                    child: Text(item.name,
                        style: new TextStyle(
                            color: colors[randomNum()], fontSize: 16.0))),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                          new DetailsPage(item.link, item.name)));
                });
          }).toList(),
        ));
  }
}
