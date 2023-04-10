// To parse this JSON data, do
//
//     final resp = respFromJson(jsonString);

import 'dart:convert';

Resp respFromJson(String str) => Resp.fromJson(json.decode(str));

String respToJson(Resp data) => json.encode(data.toJson());

class Resp<T> {
    Resp({
        required this.resCode,
        required this.resMsg,
        required this.result,
    });

    int resCode;
    String resMsg;
    T? result;

    factory Resp.fromJson(Map<String, dynamic> json, [T Function(Map<String, dynamic> json)? func]) => Resp(
        resCode: json["resCode"],
        resMsg: json["resMsg"],
        result: func != null 
          ? (json["result"] == null || json["result"] is String) ? null : func(json["result"]) 
          : json["result"],
    );

    Map<String, dynamic> toJson() => {
        "resCode": resCode,
        "resMsg": resMsg,
        "result": result,
    };

    bool get isSuccess => resCode == 1;
}
