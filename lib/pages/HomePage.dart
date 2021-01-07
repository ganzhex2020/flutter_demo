import 'package:banner_view/banner_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/bean/Api.dart';
import 'package:flutter_demo/bean/banner_bean.dart';
import 'package:flutter_demo/bean/home_list_bean.dart';
import 'package:flutter_demo/utils/CollectUtil.dart';
import 'package:flutter_demo/utils/HttpUtil.dart';
import 'package:flutter_demo/utils/NavigatorUtil.dart';
import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>{

  List<BannerData> bannerList = [];
  List<HomeListItem> homeList = new List();

  final int headerCount = 1;
  int pageIndex = 0;
  var bannerIndex = 0;

  @override
  void initState() {
    super.initState();
    getBannerList();
    getHomeList();
  }
  // 顶部刷新
  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        pageIndex = 0;
        bannerList.clear();
        homeList.clear();
        this.getBannerList();
        this.getHomeList();
      });
    });
  }

  // 底部刷新
  Future<Null> onFooterRefresh() async {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        pageIndex += 1;
        this.getHomeList();
      });
    });
  }

  //获取轮播图接口
  void getBannerList() async {
    var response = await new HttpUtil().get(Api.BANNER_LIST);
    var item = new BannerBean.fromJson(response);
    bannerList = item.data;
    setState(() {});
  }

  void getHomeList() async {
    var response = await new HttpUtil()
        .get(Api.HOME_LIST + pageIndex.toString() + "/json");
    var item = new HomeListBean.fromJson(response);
    if (item.data.datas.length == 0) {
      Fluttertoast.showToast(
          msg: "我也是有底线的！",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    if (pageIndex == 0) {
      homeList.clear();
    }
    homeList.addAll(item.data.datas);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: new Text("玩安卓"),
        ),
        body: buildCustomScrollView());
  }

  Widget buildCustomScrollView() {
    return new Refresh(
        onFooterRefresh: onFooterRefresh,
        onHeaderRefresh: onHeaderRefresh,
        childBuilder: (BuildContext context,
            {ScrollController controller, ScrollPhysics physics}) {
          return new Container(
              child: new ListView.builder(
                  physics: physics,
                  controller: controller,
                  itemCount: homeList.length + headerCount,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return buildBanner();
                    } else {
                      return buildList(homeList[index - headerCount]);
                    }
                  }));
        });
  }

  Widget buildBanner() {
    return new Container(
      //padding: EdgeInsets.all( 5),
      child: bannerList.length > 0
          ? new BannerView(
        bannerList.map((BannerData item) {
          return new GestureDetector(
              onTap: () {
                NavigatorUtil.toDetails(context, item.url, item.title);

              },
              child: new Image.network(
                item.imagePath,
                fit: BoxFit.cover,
              ));
        }).toList(),
        cycleRolling: false,
        autoRolling: true,
        indicatorMargin: 5.0,
        intervalDuration: Duration(seconds: 3),

        onPageChanged: (index) {
          bannerIndex = index;
        },
      )
          : new Container(),
      width: double.infinity,
      height: 180.0,
    );
  }

  Widget buildList(HomeListItem item) {
    return new Card(
      child: new InkWell(
        onTap: () {
          NavigatorUtil.toDetails(context, item.link, item.title);
        },
        child: new ListTile(
          title: new Row(
              children: <Widget>[
                new Text(item.author,
                    textAlign: TextAlign.left,
                    style: new TextStyle(color: Colors.grey, fontSize: 13)),
                new Text(item.niceDate,
                    textAlign: TextAlign.right,
                    style: new TextStyle(color: Colors.grey, fontSize: 13))
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center),
          subtitle: new Column(
            children: <Widget>[
              new Text(item.title,
                  textAlign: TextAlign.left,
                  style: new TextStyle(color: Colors.black, fontSize: 15)),
              new Row(
                children: <Widget>[
                  new Text(item.superChapterName + "/" + item.chapterName,
                      style: new TextStyle(color: Colors.blue, fontSize: 13)),
                  new IconButton(
                      icon: Image.asset(
                        'images/icon_like_normal.png',
                        height: 20,
                        width: 20,
                      ),
                      onPressed: () {
                        CollectUtil.collect(item.id);
                        print(homeList.indexOf(item));
                      })
                ],
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
