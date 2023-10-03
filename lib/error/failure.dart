abstract class Failure{
  final String message;

  Failure(this.message);

}

class ServerFailure extends Failure{
  ServerFailure(super.message);

}

class LocalFailure extends Failure{
  LocalFailure(super.message);

}