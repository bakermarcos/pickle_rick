class ResponseDTO<T, Z> {
  T? result;
  Z? resultError;

  Function(Function(T? success), Function(Z? error)) onDone = (p0, p1) {};

  ResponseDTO({this.result, this.resultError}) {
    onDone = (p0, p1) {
      if (result != null) {
        p0.call(result);
      }
      if (resultError != null) {
        p1.call(resultError);
      }
    };
  }
}
