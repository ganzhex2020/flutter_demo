/// data : {"admin":false,"chapterTops":[],"coinCount":0,"collectIds":[15800,15965,15978,15987,15988,16032,16045,15949,16040,16049,16062],"email":"","icon":"","id":79947,"nickname":"ganzhex2020@gmail.com","password":"","publicName":"ganzhex2020@gmail.com","token":"","type":0,"username":"ganzhex2020@gmail.com"}
/// errorCode : 0
/// errorMsg : ""

class UserInfoBean {
  UserInfo data;
  int errorCode;
  String errorMsg;

  UserInfoBean({
      this.data, 
      this.errorCode, 
      this.errorMsg});

  UserInfoBean.fromJson(dynamic json) {
    data = json["data"] != null ? UserInfo.fromJson(json["data"]) : null;
    errorCode = json["errorCode"];
    errorMsg = json["errorMsg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (data != null) {
      map["data"] = data.toJson();
    }
    map["errorCode"] = errorCode;
    map["errorMsg"] = errorMsg;
    return map;
  }

}

/// admin : false
/// chapterTops : []
/// coinCount : 0
/// collectIds : [15800,15965,15978,15987,15988,16032,16045,15949,16040,16049,16062]
/// email : ""
/// icon : ""
/// id : 79947
/// nickname : "ganzhex2020@gmail.com"
/// password : ""
/// publicName : "ganzhex2020@gmail.com"
/// token : ""
/// type : 0
/// username : "ganzhex2020@gmail.com"

class UserInfo {
  bool admin;
  //List<dynamic> chapterTops;
  int coinCount;
  List<int> collectIds;
  String email;
  String icon;
  int id;
  String nickname;
  String password;
  String publicName;
  String token;
  int type;
  String username;

  UserInfo({
      this.admin, 
    //  this.chapterTops,
      this.coinCount, 
      this.collectIds, 
      this.email, 
      this.icon, 
      this.id, 
      this.nickname, 
      this.password, 
      this.publicName, 
      this.token, 
      this.type, 
      this.username});

  UserInfo.fromJson(dynamic json) {
    admin = json["admin"];
    if (json["chapterTops"] != null) {
     // chapterTops = [];
      /*json["chapterTops"].forEach((v) {
        chapterTops.add(dynamic.fromJson(v));
      });*/
    }
    coinCount = json["coinCount"];
    collectIds = json["collectIds"] != null ? json["collectIds"].cast<int>() : [];
    email = json["email"];
    icon = json["icon"];
    id = json["id"];
    nickname = json["nickname"];
    password = json["password"];
    publicName = json["publicName"];
    token = json["token"];
    type = json["type"];
    username = json["username"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["admin"] = admin;
    /*if (chapterTops != null) {
      map["chapterTops"] = chapterTops.map((v) => v.toJson()).toList();
    }*/
    map["coinCount"] = coinCount;
    map["collectIds"] = collectIds;
    map["email"] = email;
    map["icon"] = icon;
    map["id"] = id;
    map["nickname"] = nickname;
    map["password"] = password;
    map["publicName"] = publicName;
    map["token"] = token;
    map["type"] = type;
    map["username"] = username;
    return map;
  }

}