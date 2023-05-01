import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';

// DIO helper that's connect and talk to API.
class DioHelper {
  static late Dio dio;

  // Initialize
static init() async {
  dio = Dio(
    BaseOptions(
      // API URL.
      // baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      // connectTimeout: 20 * 1000,
      // receiveTimeout: 20 * 1000,
      // Headers Needed in the API.
      headers: {
        
      },
    ),
  );
  dio.interceptors.add(CurlLoggerDioInterceptor(
    printOnSuccess: true,
  ));
}

  //This Function to call API and get Some Data based on url(End Points) and Headers needed in API to get the Specific Data.
  static Future<Response> getData({
    required String url,
     Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    String? token,
  }) async {
    try {
      print("token $token");

      dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': token ?? '',
      };
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //This Function that's Used To Post Data to API based on URL(End Points) and Headers.
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      print("dio.options $url");

      dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': token ?? '',
      };
      final Response response = await dio.post(
        url,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print("response:$response");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': token ?? '',
      };
      final Response response = await dio.put(
        url,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    required String token,
    bool files = false,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
      //'Content-Type': 'application/json',
    };
    return await dio.patch(
      url,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    required String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    try {
      final Response response = await dio.delete(
        url,
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}