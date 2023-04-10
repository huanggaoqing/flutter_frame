// ignore_for_file: unnecessary_cast

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter_getx/request/dio/dio_base.dart';
import 'package:flutter_getx/request/resp_model.dart';

class HttpWarp<T> {
  late DioBase _dioBase;
  RequestMethods _method = RequestMethods.get;
  late String _url;
  Map<String, dynamic>? _queryParameters;
  dynamic? _data;
  List<ProgressCallback> _sendProgressFuncs = [];
  List<ProgressCallback> _receiveProgressFuncs = [];
  T Function(Map<String, dynamic>)? _format;
  Map<String, dynamic> _headers = {};
  bool _isShowErrorTips = true;
  String? _tipsText;
  bool _isLoading = true;

  HttpWarp(DioBase dioBase) {
    this._dioBase = dioBase;
  }

  HttpWarp<T> setUrl(String url) {
    _url = url;
    return this;
  }

  HttpWarp<T> setMethod(RequestMethods method) {
    _method = method;
    return this;
  }

  HttpWarp<T> setData(dynamic data) {
    _data = data;
    return this;
  }

  HttpWarp<T> notLoading(){
    _isLoading = false;
    return this;
  }

  HttpWarp<T> setQueryParameters(Map<String, dynamic> queryParameters) {
    _queryParameters = queryParameters;
    return this;
  }

  HttpWarp<T> setErrorTips({bool? isShow, String? text}) {
    if (isShow != null) {
      _isShowErrorTips = isShow;
    }
    if (text != null) {
      _tipsText = text;
    }
    return this;
  }

  HttpWarp<T> addReceiveProgressFunc(ProgressCallback func) {
    _receiveProgressFuncs.add(func);
    return this;
  }

  HttpWarp<T> addSendProgressFunc(ProgressCallback func) {
    _sendProgressFuncs.add(func);
    return this;
  }

  HttpWarp<T> format(T Function(Map<String, dynamic>) func) {
    _format = func;
    return this;
  }

  HttpWarp<T> setHeaders(Map<String, dynamic> headers){
    _headers = headers;
    return this;
  }

  void _onSendProgress(int count, int total) {
    for (ProgressCallback func in _sendProgressFuncs) {
      func(count, total);
    }
  }

  Future<Resp<T?>> start() async {
    CancelFunc? cancel;
    if (_isLoading) {
      cancel = BotToast.showLoading();
    }
    Map<String, dynamic> resp = await _dioBase.request(
      methods: _method, 
      url: _url,
      queryParameters: _queryParameters,
      data: _data,
      onSendProgress: _onSendProgress,
    );
    Resp<T> res = Resp.fromJson(resp, _format);
    if(!res.isSuccess && _isShowErrorTips) {
      BotToast.showText(text: _tipsText ?? res.resMsg);
    }
    if(cancel != null) {
       cancel();
    }
    return res;
  }

}
