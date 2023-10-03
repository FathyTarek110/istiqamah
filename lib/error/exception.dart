
import 'error_massage_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

const  ServerException(this.errorMessageModel);

}

class LocalException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const  LocalException(this.errorMessageModel);

}
