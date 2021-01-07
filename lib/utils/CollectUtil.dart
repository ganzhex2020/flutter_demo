

import 'package:flutter/material.dart';
import 'package:flutter_demo/bean/Api.dart';
import 'package:flutter_demo/bean/BaseResult.dart';
import 'package:flutter_demo/bean/home_list_bean.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'HttpUtil.dart';

class CollectUtil{

  //收藏
  static collect(int id) async {
    var response =
    await new HttpUtil().post(Api.COLLECT + id.toString() + "/json");
    var item = new BaseResult.fromJson(response);
    if (item.errorCode == 0) {
      Fluttertoast.showToast(
          msg: "收藏成功！",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: item.errorMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }


}