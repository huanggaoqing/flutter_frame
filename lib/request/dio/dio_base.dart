// ignore_for_file: prefer_conditional_assignment, prefer_final_fields

import 'package:dio/dio.dart';
import 'package:flutter_getx/request/resp_model.dart';

/// 请求方式
enum RequestMethods {
  get(name: "GET", key: 1),
  post(name: "POST", key: 2),
  put(name: "PUT", key: 3),
  delete(name:"DELETE", key: 4);

  final String name;
  final int key;
  const RequestMethods({required this.name, required this.key});
}

typedef HandleFinalFunction = void Function(Response<Map<String, dynamic>>);

/// dio基础封装
/// 对外暴露request，download，upload方法
class DioBase {
  late Dio _dio;

  static DioBase? _instance;

  List<Interceptor> _interceptorList = [];

  BaseOptions? _config;

  bool _log = false;

  HandleFinalFunction? _handleFinalFunction;

  factory DioBase({BaseOptions? config}) => getInstance(config: config);
  
  DioBase._internal({BaseOptions? config}) {
    if(config != null) {
      _config = config;
    }
  }

  static DioBase getInstance({BaseOptions? config}) {
    if (_instance == null) {
      _instance = DioBase._internal(config: config);
    }
    return _instance!;
  }

  void init() {
    _dio = Dio(_config);
    for (Interceptor item in _interceptorList) {
      _dio.interceptors.add(item);
    }
    if(_log){
      _dio.interceptors.add(LogInterceptor(request: true));
    }
  }

  DioBase isPrintLog(bool log) {
    _log = log;
    return this;
  }
  
  DioBase addInterceptors(Interceptor interceptor) {
    _interceptorList.add(interceptor);
    return this;
  }

  DioBase addHandleFinalFunction(HandleFinalFunction func) {
    _handleFinalFunction = func;
    return this;
  }

  Future<Map<String, dynamic>> request({
    required RequestMethods methods,
    required String url,
    Map<String, dynamic>? headers,
    dynamic data,
    ProgressCallback? onSendProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancel
  }) async {
    try {
      Options options = Options()
      ..headers = headers
      ..method = methods.name;

      Response<Map<String, dynamic>> resp = await _dio.request(
        url, 
        options: options,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancel,
        onSendProgress: onSendProgress,
      );
      // 请求失败统一处理
      if (resp.statusCode != 200) {
        if (_handleFinalFunction != null) {
          _handleFinalFunction!(resp);
        }
        return Resp(resCode: 400, resMsg: "请求失败", result: null).toJson();
      }
      return resp.data!;
    } catch(e) {
      return Resp(resCode: 400, resMsg: "网络错误，请检查您的网络", result: null).toJson();
    }
  }

  Future<Map<String, dynamic>> download() async {
    return {};
  }

  Future<Map<String, dynamic>> upload() async {
    return {};
  }

}
