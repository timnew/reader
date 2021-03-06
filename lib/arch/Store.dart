import 'package:async/async.dart';
import 'package:flutter/foundation.dart';

import 'FuncTypes.dart';
export 'FuncTypes.dart';

class ResultStore<T> {
  final ValueNotifier<Result<T>> _notifier;

  ValueListenable<Result<T>> get listenable => _notifier;

  ResultStore(T value) : _notifier = ValueNotifier(Result.value(value));

  ResultStore.error(Object error, [StackTrace stackTrace]) : _notifier = ValueNotifier(Result.error(error, stackTrace));

  Result<T> get result => _notifier.value;

  bool get isValue => result.isValue;

  bool get isError => result.isError;

  T get value {
    if (isError) throw StateError("Use ErrorResult as ValueResult");
    return result.asValue.value;
  }

  Object get error {
    if (isValue) throw StateError("Use ValueResult as ErrorResult");
    return result.asError.error;
  }

  StackTrace get stackTrace {
    if (isValue) throw StateError("Use ValueResult as ErrorResult");
    return result.asError.stackTrace;
  }

  T putValue(T value) {
    _notifier.value = Result.value(value);
    return value;
  }

  void putError(Object error, [StackTrace stackTrace]) {
    _notifier.value = Result.error(error, stackTrace);
  }

  T updateValue(ValueUpdater<T> updater) {
    if (isError) return null;

    return putValue(updater(value));
  }

  T fixError(ErrorFixer<T> fixer) {
    if (isValue) return value;

    return putValue(fixer(error));
  }
}
