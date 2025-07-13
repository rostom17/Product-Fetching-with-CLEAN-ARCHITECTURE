import 'package:dio/dio.dart';

class RequsetModel {
  final String path;
  final Map<String, dynamic>? queryParams;
  final Map<String, String>? headers;
  final FormData? formData;

  RequsetModel({
    required this.path,
    this.queryParams,
    this.headers,
    this.formData,
  });
}
