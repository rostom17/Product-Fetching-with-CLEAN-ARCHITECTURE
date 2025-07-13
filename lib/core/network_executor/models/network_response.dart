class NetworkResponse {
  final int statusCode;
  final dynamic bodyData;
  final String? errorMessage;

  NetworkResponse({
    required this.statusCode,
    required this.bodyData,
    this.errorMessage,
  });
}
