import '../constants/constants.dart';
import 'server_exception.dart';

class UnauthorizedException extends ServerException {
  UnauthorizedException({required String message})
      : super(message: message, code: Constants.unauthorized);
}
