abstract class UseCase<TResponse> {
  Future<TResponse> execute();
}

abstract class UseCaseWithParams<TResponse, TParams> {
  Future<TResponse> execute(TParams params);
}

abstract class UseCaseNoFuture<TResponse> {
  TResponse execute();
}

abstract class UseCaseNoFutureWithParams<TResponse, TParams> {
  TResponse execute(TParams params);
}
