/// data : {"curPage":1,"datas":[{"apkLink":"","audit":1,"author":"xingtangcunliu","canEdit":false,"chapterId":403,"chapterName":"序列化","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":8236,"link":"https://xingtangcunliu.github.io/2016/11/02/Android-Bundle/","niceDate":"2019-04-11 21:02","niceShareDate":"未知时间","origin":"","prefix":"","projectLink":"","publishTime":1554987752000,"realSuperChapterId":167,"selfVisible":0,"shareDate":null,"shareUser":"","superChapterId":168,"superChapterName":"基础知识","tags":[],"title":"Bundle、Parcel解析","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"阿敏其人","canEdit":false,"chapterId":403,"chapterName":"序列化","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":3322,"link":"https://www.jianshu.com/p/a60b609ec7e7","niceDate":"2018-08-27 16:54","niceShareDate":"未知时间","origin":"","prefix":"","projectLink":"","publishTime":1535360064000,"realSuperChapterId":167,"selfVisible":0,"shareDate":null,"shareUser":"","superChapterId":168,"superChapterName":"基础知识","tags":[],"title":"序列化Serializable和Parcelable的理解和区别","type":0,"userId":-1,"visible":1,"zan":0}],"offset":0,"over":true,"pageCount":1,"size":20,"total":2}
/// errorCode : 0
/// errorMsg : ""

class ArticleListBean {
  ArticleList data;
  int errorCode;
  String errorMsg;

  ArticleListBean({
      this.data, 
      this.errorCode, 
      this.errorMsg});

  ArticleListBean.fromJson(dynamic json) {
    data = json["data"] != null ? ArticleList.fromJson(json["data"]) : null;
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

/// curPage : 1
/// datas : [{"apkLink":"","audit":1,"author":"xingtangcunliu","canEdit":false,"chapterId":403,"chapterName":"序列化","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":8236,"link":"https://xingtangcunliu.github.io/2016/11/02/Android-Bundle/","niceDate":"2019-04-11 21:02","niceShareDate":"未知时间","origin":"","prefix":"","projectLink":"","publishTime":1554987752000,"realSuperChapterId":167,"selfVisible":0,"shareDate":null,"shareUser":"","superChapterId":168,"superChapterName":"基础知识","tags":[],"title":"Bundle、Parcel解析","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"阿敏其人","canEdit":false,"chapterId":403,"chapterName":"序列化","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"host":"","id":3322,"link":"https://www.jianshu.com/p/a60b609ec7e7","niceDate":"2018-08-27 16:54","niceShareDate":"未知时间","origin":"","prefix":"","projectLink":"","publishTime":1535360064000,"realSuperChapterId":167,"selfVisible":0,"shareDate":null,"shareUser":"","superChapterId":168,"superChapterName":"基础知识","tags":[],"title":"序列化Serializable和Parcelable的理解和区别","type":0,"userId":-1,"visible":1,"zan":0}]
/// offset : 0
/// over : true
/// pageCount : 1
/// size : 20
/// total : 2

class ArticleList {
  int curPage;
  List<Article> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  ArticleList({
      this.curPage, 
      this.datas, 
      this.offset, 
      this.over, 
      this.pageCount, 
      this.size, 
      this.total});

  ArticleList.fromJson(dynamic json) {
    curPage = json["curPage"];
    if (json["datas"] != null) {
      datas = [];
      json["datas"].forEach((v) {
        datas.add(Article.fromJson(v));
      });
    }
    offset = json["offset"];
    over = json["over"];
    pageCount = json["pageCount"];
    size = json["size"];
    total = json["total"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["curPage"] = curPage;
    if (datas != null) {
      map["datas"] = datas.map((v) => v.toJson()).toList();
    }
    map["offset"] = offset;
    map["over"] = over;
    map["pageCount"] = pageCount;
    map["size"] = size;
    map["total"] = total;
    return map;
  }

}

/// apkLink : ""
/// audit : 1
/// author : "xingtangcunliu"
/// canEdit : false
/// chapterId : 403
/// chapterName : "序列化"
/// collect : false
/// courseId : 13
/// desc : ""
/// descMd : ""
/// envelopePic : ""
/// fresh : false
/// host : ""
/// id : 8236
/// link : "https://xingtangcunliu.github.io/2016/11/02/Android-Bundle/"
/// niceDate : "2019-04-11 21:02"
/// niceShareDate : "未知时间"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1554987752000
/// realSuperChapterId : 167
/// selfVisible : 0
/// shareDate : null
/// shareUser : ""
/// superChapterId : 168
/// superChapterName : "基础知识"
/// tags : []
/// title : "Bundle、Parcel解析"
/// type : 0
/// userId : -1
/// visible : 1
/// zan : 0

class Article {
  String apkLink;
  int audit;
  String author;
  bool canEdit;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String descMd;
  String envelopePic;
  bool fresh;
  String host;
  int id;
  String link;
  String niceDate;
  String niceShareDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int realSuperChapterId;
  int selfVisible;
  dynamic shareDate;
  String shareUser;
  int superChapterId;
  String superChapterName;
//  List<dynamic> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  Article({
      this.apkLink, 
      this.audit, 
      this.author, 
      this.canEdit, 
      this.chapterId, 
      this.chapterName, 
      this.collect, 
      this.courseId, 
      this.desc, 
      this.descMd, 
      this.envelopePic, 
      this.fresh, 
      this.host, 
      this.id, 
      this.link, 
      this.niceDate, 
      this.niceShareDate, 
      this.origin, 
      this.prefix, 
      this.projectLink, 
      this.publishTime, 
      this.realSuperChapterId, 
      this.selfVisible, 
      this.shareDate, 
      this.shareUser, 
      this.superChapterId, 
      this.superChapterName, 
  //    this.tags,
      this.title, 
      this.type, 
      this.userId, 
      this.visible, 
      this.zan});

  Article.fromJson(dynamic json) {
    apkLink = json["apkLink"];
    audit = json["audit"];
    author = json["author"];
    canEdit = json["canEdit"];
    chapterId = json["chapterId"];
    chapterName = json["chapterName"];
    collect = json["collect"];
    courseId = json["courseId"];
    desc = json["desc"];
    descMd = json["descMd"];
    envelopePic = json["envelopePic"];
    fresh = json["fresh"];
    host = json["host"];
    id = json["id"];
    link = json["link"];
    niceDate = json["niceDate"];
    niceShareDate = json["niceShareDate"];
    origin = json["origin"];
    prefix = json["prefix"];
    projectLink = json["projectLink"];
    publishTime = json["publishTime"];
    realSuperChapterId = json["realSuperChapterId"];
    selfVisible = json["selfVisible"];
    shareDate = json["shareDate"];
    shareUser = json["shareUser"];
    superChapterId = json["superChapterId"];
    superChapterName = json["superChapterName"];
   /* if (json["tags"] != null) {
      tags = [];
      json["tags"].forEach((v) {
        tags.add(dynamic.fromJson(v));
      });
    }*/
    title = json["title"];
    type = json["type"];
    userId = json["userId"];
    visible = json["visible"];
    zan = json["zan"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["apkLink"] = apkLink;
    map["audit"] = audit;
    map["author"] = author;
    map["canEdit"] = canEdit;
    map["chapterId"] = chapterId;
    map["chapterName"] = chapterName;
    map["collect"] = collect;
    map["courseId"] = courseId;
    map["desc"] = desc;
    map["descMd"] = descMd;
    map["envelopePic"] = envelopePic;
    map["fresh"] = fresh;
    map["host"] = host;
    map["id"] = id;
    map["link"] = link;
    map["niceDate"] = niceDate;
    map["niceShareDate"] = niceShareDate;
    map["origin"] = origin;
    map["prefix"] = prefix;
    map["projectLink"] = projectLink;
    map["publishTime"] = publishTime;
    map["realSuperChapterId"] = realSuperChapterId;
    map["selfVisible"] = selfVisible;
    map["shareDate"] = shareDate;
    map["shareUser"] = shareUser;
    map["superChapterId"] = superChapterId;
    map["superChapterName"] = superChapterName;
    /*if (tags != null) {
      map["tags"] = tags.map((v) => v.toJson()).toList();
    }*/
    map["title"] = title;
    map["type"] = type;
    map["userId"] = userId;
    map["visible"] = visible;
    map["zan"] = zan;
    return map;
  }

}