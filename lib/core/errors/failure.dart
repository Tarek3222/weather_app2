import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure("Connection Timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return const ServerFailure("send Timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return const ServerFailure("Receive Timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return const ServerFailure("Bad Certificate with ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return const ServerFailure("Request to ApiServer was cancelled");
      case DioExceptionType.connectionError:
        return const ServerFailure("No internet connection");
      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")) {
          return const ServerFailure("No internet connection");
        }
        return const ServerFailure("Unexpected error with ApiServer");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response["error"]["message"]);
    } else if (statusCode == 404) {
      return const ServerFailure("Your request not found, please try later");
    } else if (statusCode == 500) {
      return const ServerFailure("Internal server error");
    } else {
      return const ServerFailure(
          "Something went wrong, please try again later");
    }
  }
}
