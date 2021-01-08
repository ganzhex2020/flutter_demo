import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/HomePage.dart';
import 'package:flutter_demo/pages/HotSearchPage.dart';
import 'package:flutter_demo/pages/MinePage.dart';
import 'package:flutter_demo/pages/ProjectPage.dart';
import 'package:flutter_demo/pages/SystemPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Widget> pageData;

  @override
  void initState() {
    super.initState();
    pageData = new List();
    pageData
      ..add(HomePage())
      ..add(SystemPage())
      ..add(HotSearchPage())
      ..add(ProjectPage())
      ..add(MinePage());
  }

  @override
  Widget build(BuildContext context) {
    //return Container();
    return Scaffold(
      //appBar: AppBar(centerTitle:true,title: Text("玩安卓"),),
      body: IndexedStack(
        index: _selectedIndex,
        children: pageData,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          new BottomNavigationBarItem(icon: Icon(Icons.layers), label: '体系'),
          new BottomNavigationBarItem(icon: Icon(Icons.search), label: '热搜'),
          new BottomNavigationBarItem(icon: Icon(Icons.folder), label: '项目'),
          new BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
