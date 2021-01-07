class BaseResult<T> {

  int errorCode;
  String errorMsg;
  T data;

  BaseResult({
    this.data,
    this.errorCode,
    this.errorMsg});

  BaseResult.fromJson(dynamic json) {
    data = (json["data"] != null ? BaseResult.fromJson(json["data"]) : null) as T;
    errorCode = json["errorCode"];
    errorMsg = json["errorMsg"];
  }


}