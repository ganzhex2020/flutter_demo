import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/DetailsPage.dart';
import 'package:flutter_demo/bean/system_tree_bean.dart';
import 'package:flutter_demo/pages/SystemListPage.dart';

class NavigatorUtil {
  ///详情页面
  static void toDetails(BuildContext context, String url, String title) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new DetailsPage(url, title)));
  }

  ///体系列表页面
  static void toSystemList(
      BuildContext context, List<Children> list, String title) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new SystemListPage(list, title)));
  }
}
