import 'package:dio/dio.dart';
import 'package:hrm_employee/db/db.dart';
import 'package:hrm_employee/utils/locator.dart';
import 'package:hrm_employee/utils/utils.dart';

class Api {
  Dio _dio = Dio();

  DB _db = locator<DB>();
  Api() {}

  Future<Response> postNoHeaders(url, data) {
    return _dio.post(serverUrl + url,
        data: data,
        options: Options(
            responseType: ResponseType.json,
            validateStatus: (st) {
              return st! < 500;
            }));
  }
  // Future<Token> _token = _db.token();

}
