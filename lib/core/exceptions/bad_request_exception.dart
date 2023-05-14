import '../constants/constants.dart';
import 'server_exception.dart';

class BadRequestException extends ServerException {
  BadRequestException({required String message})
      : super(message: message, code: Constants.badRequest);
}
