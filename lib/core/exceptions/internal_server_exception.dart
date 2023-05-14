import '../constants/constants.dart';
import 'server_exception.dart';

class InternalServerException extends ServerException {
  InternalServerException({required String message})
      : super(message: message, code: Constants.internalServerError);
}
