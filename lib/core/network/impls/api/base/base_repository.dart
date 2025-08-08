

import 'package:pickle_rick/core/network/api/result/result.dart';
import 'package:pickle_rick/core/network/extensions/exception_extension.dart';
import 'package:pickle_rick/core/network/impls/api/exceptions/unknow_exception.dart';

class BaseRepository {
  Result<T, Exception> handleFailure<T>({
    required String repositoryName,
    dynamic error,
    StackTrace? trace,
  }) {
    if (error is Exception) {
      error.debugPrint();
      return Result.failure(error);
    } else {
      var unknownException = UnknowException();
      unknownException.debugPrint();
      return Result.failure(unknownException);
    }
  }
}
