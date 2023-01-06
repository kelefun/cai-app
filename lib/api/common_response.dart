/// 响应数据头数据统一管理
class CommonResponse<T> {
  int? code;// 状态码
  String? message; // 状态码说明
  T? data; // 渲染数据

  CommonResponse({this.code, this.message, this.data});

  factory CommonResponse.fromJson(json) {
    try {
         return CommonResponse(
          code: json["code"] ?? -1,
          message: json["message"],
          data: json["data"]);//TODO
    } catch (e) {
      return CommonResponse(code: -1, message: "服务器开小差了~", data: null);
    }
  }
}