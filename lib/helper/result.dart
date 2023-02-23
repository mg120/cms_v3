class Result<T> {
  Result._();

  factory Result.init() = InitResult<T>;

  factory Result.loading() = LoadingResult<T>;

  factory Result.empty() = EmptyResult<T>;

  factory Result.loadMore(T data) = LoadMoreResult<T>;

  factory Result.success(T data) = SuccessResult<T>;

  factory Result.error(String errorMsg) = ErrorResult<T>;

  factory Result.connectionError() = ConnectionErrorResult<T>;

}

class InitResult<T> extends Result<T> {
  InitResult() : super._();
}

class LoadingResult<T> extends Result<T> {
  LoadingResult() : super._();
}

class EmptyResult<T> extends Result<T> {
  EmptyResult() : super._();
}

class LoadMoreResult<T> extends Result<T> {
  final T data;

  LoadMoreResult(this.data) : super._();
}

class SuccessResult<T> extends Result<T> {
  final T? data;

  SuccessResult(this.data) : super._();
}

class ErrorResult<T> extends Result<T> {
  final String errorMsg;

  ErrorResult(this.errorMsg) : super._();
}

class ConnectionErrorResult<T> extends Result<T> {
  ConnectionErrorResult() : super._();
}
