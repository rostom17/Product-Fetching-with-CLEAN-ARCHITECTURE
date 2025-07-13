/// Network executor is class for handling all the network calls

import "package:dio/dio.dart";

import 'models/network_response.dart';
import 'models/requset_model.dart';
import './error_mapper/error_mapper.dart';

class NetworkExecutor {
  final Dio dio;
  final ErrorMapper errorMapper;

  NetworkExecutor(this.errorMapper, {required this.dio});

  Future<NetworkResponse> getRequest(RequsetModel requestModel) async {
    try {
      final Response response = await dio.get(
        requestModel.path,
        queryParameters: requestModel.queryParams,
        data: requestModel.formData,
        options: Options(headers: requestModel.headers),
      );
      return NetworkResponse(
        statusCode: response.statusCode ?? -1,
        bodyData: response.data,
        errorMessage: response.statusMessage,
      );
    } catch (e) {
      return errorMapper.mapError(e as Exception);
    }
  }

  Future<NetworkResponse> postRequest(RequsetModel requestModel) async {
    try {
      final Response response = await dio.post(
        requestModel.path,
        queryParameters: requestModel.queryParams,
        data: requestModel.formData,
        options: Options(headers: requestModel.headers),
      );

      return NetworkResponse(
        statusCode: response.statusCode ?? -1,
        bodyData: response.data,
      );
    } catch (e) {
      return errorMapper.mapError(e as Exception);
    }
  }
}
