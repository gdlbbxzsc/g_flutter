import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'http_error.dart';

typedef HttpSuccessCallback<T> = void Function(dynamic data);
typedef HttpFailureCallback = void Function(HttpError data);

typedef T JsonParse<T>(dynamic data);

class HttpManager {
  ///同一个CancelToken可以用于多个请求，当一个CancelToken取消时，所有使用该CancelToken的请求都会被取消，一个页面对应一个CancelToken。
  final Map<String, CancelToken> _cancelTokens = Map<String, CancelToken>();

  ///超时时间
  static const int _CONNECT_TIMEOUT = 30000;
  static const int _RECEIVE_TIMEOUT = 30000;

  static const String BASE_URL = "";

  Dio _client;

  factory HttpManager() => _instance;
  static final HttpManager _instance = HttpManager._internal();

  HttpManager._internal() {
    if (_client == null) {
      _client = Dio(BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: _CONNECT_TIMEOUT,
        receiveTimeout: _RECEIVE_TIMEOUT,
      ));

//        ..httpClientAdapter = Http2Adapter(
//          ConnectionManager(idleTimeout: CONNECT_TIMEOUT),
//        );

//      _client.interceptors..add(LcfarmLogInterceptor());
    }
  }

  Dio get client => _client;

  void reset(
      {String baseUrl,
      int connectTimeout,
      int receiveTimeout,
      List<Interceptor> interceptors}) {
    _client.options = _client.options.merge(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    if (interceptors != null && interceptors.isNotEmpty) {
      _client.interceptors..addAll(interceptors);
    }
  }

  void get({
    @required String tag,
    @required String url,
    Map<String, dynamic> paramsMap,
    List<dynamic> paramsList,
    Options options,
    HttpSuccessCallback successCallback,
    HttpFailureCallback errorCallback,
  }) async {
    options = _make2Get(options);
    _request(
      tag: tag,
      url: url,
      paramsMap: paramsMap,
      paramsList: paramsList,
      options: options,
      successCallback: successCallback,
      errorCallback: errorCallback,
    );
  }

  void post({
    @required String tag,
    @required String url,
    Map<String, dynamic> paramsMap,
    List<dynamic> paramsList,
    data,
    Options options,
    HttpSuccessCallback successCallback,
    HttpFailureCallback errorCallback,
  }) async {
    options = _make2Post(options);

    _request(
      tag: tag,
      url: url,
      paramsMap: paramsMap,
      paramsList: paramsList,
      data: data,
      options: options,
      successCallback: successCallback,
      errorCallback: errorCallback,
    );
  }

  ///[url] 网络请求地址不包含域名
  ///[data] post 请求参数
  ///[options] 请求配置
  ///[successCallback] 请求成功回调
  ///[errorCallback] 请求失败回调
  ///[tag] 请求统一标识，用于取消网络请求
  void _request({
    @required String tag,
    @required String url,
    Map<String, dynamic> paramsMap,
    List<dynamic> paramsList,
    data,
    Options options,
    HttpSuccessCallback successCallback,
    HttpFailureCallback errorCallback,
  }) async {
    try {
//    //检查网络是否连接
//    if (checkNetWork()) {
//      if (errorCallback != null) {
//        errorCallback(HttpError(HttpError.NETWORK_ERROR, "网络异常，请稍后重试！"));
//      }
//      print("请求网络异常，请稍后重试！");
//      return;
//    }

      url = _jionUrlPathData(url, paramsList);

      CancelToken cancelToken = _cacheToken(tag);

      Response<Map<String, dynamic>> response = await _client.request(url,
          queryParameters: paramsMap,
          data: data,
          options: options,
          cancelToken: cancelToken);

      String statusCode = response.data["statusCode"];
      if (statusCode == "0") {
        //成功
        if (successCallback != null) {
          successCallback(response.data["data"]);
        }
      } else {
        //失败
        String message = response.data["statusDesc"];
        print("请求服务器出错：$message");
        if (errorCallback != null) {
          errorCallback(HttpError(statusCode, message));
        }
      }
    } on DioError catch (e, s) {
      print("请求出错：$e\n$s");
      if (errorCallback != null && e.type != DioErrorType.CANCEL) {
        errorCallback(HttpError.dioError(e));
      }
    } catch (e, s) {
      print("未知异常出错：$e\n$s");
      if (errorCallback != null) {
        errorCallback(HttpError("-1", "网络异常，请稍后重试！"));
      }
    }

//    // 请求超时
//    if (error.type == DioErrorType.CONNECT_TIMEOUT) {
//      errorResponse.statusCode = ResultCode.CONNECT_TIMEOUT;
//    }
//    // 一般服务器错误
//    else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
//      errorResponse.statusCode = ResultCode.RECEIVE_TIMEOUT;
//    }
  }

  ///下载文件
  ///
  ///[url] 下载地址
  ///[savePath]  文件保存路径
  ///[onReceiveProgress]
  ///[data] post 请求参数
  ///[params] url请求参数支持restful
  ///[options] 请求配置
  ///[successCallback] 请求成功回调
  ///[errorCallback] 请求失败回调
  ///[tag] 请求统一标识，用于取消网络请求
  void download({
    @required String url,
    @required savePath,
    ProgressCallback onReceiveProgress,
    Map<String, dynamic> params,
    data,
    Options options,
    HttpSuccessCallback successCallback,
    HttpFailureCallback errorCallback,
    @required String tag,
  }) async {
//    Response response = await _client.download(url, savePath,
//        onReceiveProgress: onReceiveProgress,
//        queryParameters: params,
//        data: data,
//        options: options,
//        cancelToken: cancelToken);
  }

  ///上传文件
  ///
  ///[url] 网络请求地址不包含域名
  ///[data] post 请求参数
  ///[onSendProgress] 上传进度
  ///[params] url请求参数支持restful
  ///[options] 请求配置
  ///[successCallback] 请求成功回调
  ///[errorCallback] 请求失败回调
  ///[tag] 请求统一标识，用于取消网络请求
  void upload({
    @required String url,
    FormData data,
    ProgressCallback onSendProgress,
    Map<String, dynamic> params,
    Options options,
    HttpSuccessCallback successCallback,
    HttpFailureCallback errorCallback,
    @required String tag,
  }) async {
//      Response<Map<String, dynamic>> response = await _client.request(url,
//          onSendProgress: onSendProgress,
//          data: data,
//          queryParameters: params,
//          options: options,
//          cancelToken: cancelToken);
  }

  ///取消网络请求
  void cancel(String tag) {
    if (!_cancelTokens.containsKey(tag)) return;

    if (!_cancelTokens[tag].isCancelled) _cancelTokens[tag].cancel();

    _cancelTokens.remove(tag);
  }

  ///restful处理
  String _jionUrlPathData(String url, List<dynamic> params) {
    if (params == null || params.isEmpty) return url;

    StringBuffer sb = StringBuffer();
    sb.write(url);
    params.forEach((obj) {
      if (obj == null) return;
      sb.write("/");
      sb.write(obj);
    });

    return sb.toString();
  }

  bool checkNetWork() {
    //    //检查网络是否连接
//    ConnectivityResult connectivityResult =
//        await (Connectivity().checkConnectivity());
//    if (connectivityResult == ConnectivityResult.none) {
//      if (errorCallback != null) {
//        errorCallback(HttpError(HttpError.NETWORK_ERROR, "网络异常，请稍后重试！"));
//      }
//      print("请求网络异常，请稍后重试！");
//      return;
//    }
    return true;
  }

  CancelToken _cacheToken(String tag) {
    if (tag == null) return null;
    CancelToken cancelToken = _cancelTokens[tag];
    if (cancelToken == null) {
      cancelToken = CancelToken();
      _cancelTokens[tag] = cancelToken;
    }
    return cancelToken;
  }

  Options _make2Post(Options opt) {
    Options options = opt ?? Options();
    options.method = 'post';
    return options;
  }

  Options _make2Get(Options opt) {
    Options options = opt ?? Options();
    options.method = 'get';
    return options;
  }
}
