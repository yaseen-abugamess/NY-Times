import '../constants/constants.dart';
import 'server_exception.dart';

class NotFoundException extends ServerException {
  NotFoundException({required String message})
      : super(message: message, code: Constants.notFound);
}
