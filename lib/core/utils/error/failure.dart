abstract class Failure{
  const Failure();
}

class CacheFailure extends Failure{
  String? message;
  CacheFailure(this.message);
}