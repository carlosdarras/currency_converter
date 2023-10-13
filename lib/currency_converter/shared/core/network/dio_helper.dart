// import 'package:dio/dio.dart';
//
//
// /// a4b77219d2fe488fb655983205ef6443
//
// // v2/top-headlines?country=us&category=business&apiKey=a4b77219d2fe488fb655983205ef6443
//
// class DioHelper {
//   static Dio? dio;
//
//   static init() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: "https://newsapi.org/",
//         receiveDataWhenStatusError: true,
//       ),
//     );
//   }
//
//   static Future<Response> getData(
//       {required String url, required Map<String, dynamic> query}) async {
//     return await dio!.get(url, queryParameters: query);
//    }
// }

import 'package:currency_converter/currency_converter/shared/constant/app_value.dart';
import 'package:dio/dio.dart';

class DioHelper {
  Dio? _dioInstance;

  Dio? get dio {
    _dioInstance ??= init();
    return _dioInstance;
  }

  static init() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppValue.baseUrl,
        headers: <String, String>{},
      ),
    );

    return dio;
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
      "lang": lang ?? "en",
      "Authorization": token ?? "",
    };
    var x = await dio!.get(url, queryParameters: query);
    return x;
  }
}
