class Failure {
}
class ServerFailure extends Failure {}



class FailureMessages {
  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server Error";
      default:
        return 'Unexpected error';
    }
  }
}
