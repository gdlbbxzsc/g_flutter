import 'package:dio/dio.dart';

/// @desc  网络请求错误
/// @time 2019/3/20 10:02 AM
/// @author Cheney
class HttpError {
  final Map<int, String> _serverErrorMap = {401: "UNKNOWN1", 402: "UNKNOWN2"};
  final Map<DioErrorType, String> _sysErrorMap = {
    DioErrorType.CONNECT_TIMEOUT: "UNKNOWN1"
  };

  String code;
  DioErrorType dioErrorType;

  String message;

  HttpError(this.code, this.message);

  HttpError.dioError(DioError error) {
    dioErrorType = error.type;
    message = _sysErrorMap[error.type];
  }

  @override
  String toString() {
    return 'HttpError{code: $code, message: $message}';
  }
}
