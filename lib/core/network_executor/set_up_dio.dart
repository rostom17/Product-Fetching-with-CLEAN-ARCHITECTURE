import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:product_with_clean_arc/config/network_config.dart';
import '../network_executor/interceptor/logger_interceptor.dart';

Dio getDioInstance() {
  BaseOptions dioOption = BaseOptions(
    baseUrl: NetworkConfig.baseUrl,
    connectTimeout: NetworkConfig.connectionTimeOut,
    headers: {"token": "", "content-type": "application/json"},
  );

  final Dio dio = Dio(dioOption);

  List<Interceptor> interceptors = [
    LoggerInterceptor(),
    RetryInterceptor(
      dio: dio,
      retries: 2,
      retryDelays: [const Duration(seconds: 5), const Duration(seconds: 11)],
    ),
    //Refresh Interceptor
  ];

  dio.interceptors.addAll(interceptors);

  return dio;
}
