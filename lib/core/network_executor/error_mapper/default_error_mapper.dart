import 'package:dio/dio.dart';

import 'error_mapper.dart';
import '../models/network_response.dart';

class DefaultErrorMapper implements ErrorMapper {
  @override
  NetworkResponse mapError(Exception e) {
    if (e is DioException) {
      if (e.response?.statusCode == 401) {
        //Unauthorized: redirect to login
        return NetworkResponse(
          statusCode: 401,
          bodyData: null,
          errorMessage: "Unauthorized.! Login Required",
        );
      } else if (e.response?.statusCode == 403) {
        //Forbidden:
        return NetworkResponse(
          statusCode: 403,
          bodyData: null,
          errorMessage: "Forbidden.! Try again",
        );
      } else if (e.response?.statusCode == 404) {
        //Not Found:
        return NetworkResponse(
          statusCode: 404,
          bodyData: null,
          errorMessage: "404 Not Found",
        );
      } else {
        return NetworkResponse(
          statusCode: e.response?.statusCode ?? -1,
          bodyData: e.response?.data,
          errorMessage: "Something is Wrong.! Try again"
        );
      }
    } else {
      return NetworkResponse(
        statusCode: -1,
        bodyData: null,
        errorMessage: "Something went wrong",
      );
    }
  }
}
