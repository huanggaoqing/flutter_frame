import 'package:dio/dio.dart';
import 'package:flutter_getx/request/dio/dio_base.dart';
import 'package:flutter_getx/request/dio/interceptor_normal.dart';
import 'package:flutter_getx/request/http_warp.dart';

enum Env {
  test,
  beta,
  pro,
}

///### 调用示例
///```dart
///var resp = await request<Detail>()
/// .setUrl("url")
/// .format(Detail.fromJson)
/// .start();
/// ```
mixin HttpMain {
  String _getBaseUrl(Env env) {
    switch (env) {
      case Env.test:
        return "https://venus-test.bodypark.cn";
      case Env.beta:
        return "https://venus-beta.bodypark.cn";
      case Env.pro:
        return "https://venus.bodypark.cn";
    } 
  }

  void _handleRequestFinal(Response<Map<String, dynamic>> resp) {

  }

  void register(Env env){
    DioBase(config: BaseOptions(
      baseUrl: _getBaseUrl(env),
    ))
    .isPrintLog(true)
    .addInterceptors(InterceptorNormal())
    .addHandleFinalFunction(_handleRequestFinal)
    .init();
  }
  
  HttpWarp<T> request<T>() => HttpWarp<T>(DioBase());
}
