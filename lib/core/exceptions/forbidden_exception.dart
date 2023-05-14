import '../constants/constants.dart';
import 'server_exception.dart';

class ForbiddenException extends ServerException {
  ForbiddenException({required String message})
      : super(message: message, code: Constants.forbidden);
}
