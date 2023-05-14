import 'dart:convert';

import 'package:http/http.dart';

import '../constants/constants.dart';
import '../exceptions/bad_request_exception.dart';
import '../exceptions/forbidden_exception.dart';
import '../exceptions/internal_server_exception.dart';
import '../exceptions/not_found_exception.dart';
import '../exceptions/unauthorized_exception.dart';

class HttpUtil {
  static String getErrorMessage(dynamic result) {
    if (result['error'] is String) {
      return result['error'];
    } else if (result['message'] is String) {
      return result['message'];
    }
    return Constants.somethingWentWrong;
  }

  static dynamic getResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        final responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        return BadRequestException(
          message: getErrorMessage(json.decode(response.body)),
        );
      case 401:
        return UnauthorizedException(
          message: getErrorMessage(json.decode(response.body)),
        );
      case 403:
        return ForbiddenException(
          message: getErrorMessage(json.decode(response.body)),
        );
      case 404:
        return NotFoundException(
          message: getErrorMessage(json.decode(response.body)),
        );
      case 500:
        return InternalServerException(
          message: Constants.internalServerError,
        );
      default:
        return InternalServerException(
          message: Constants.somethingWentWrong,
        );
    }
  }
}
