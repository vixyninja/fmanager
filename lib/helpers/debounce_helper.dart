import 'dart:async';

typedef DebounceCallback = void Function();

class _DebounceOperation {
  DebounceCallback callback;
  Timer timer;

  _DebounceOperation(this.callback, this.timer);
}

class DebounceHelper {
  static final Map<String, _DebounceOperation> _operations = {};
  static void debounce(String tag, Duration duration, DebounceCallback onExecute) {
    if (duration == Duration.zero) {
      _operations[tag]?.timer.cancel();
      _operations.remove(tag);
      onExecute();
    } else {
      _operations[tag]?.timer.cancel();
      _operations[tag] = _DebounceOperation(
        onExecute,
        Timer(duration, () {
          _operations[tag]?.timer.cancel();
          _operations.remove(tag);
          onExecute();
        }),
      );
    }
  }

  static void fire(String tag) {
    _operations[tag]?.callback();
  }

  static void cancel(String tag) {
    _operations[tag]?.timer.cancel();
    _operations.remove(tag);
  }

  static void cancelAll() {
    for (final operation in _operations.values) {
      operation.timer.cancel();
    }
    _operations.clear();
  }

  static int count() {
    return _operations.length;
  }
}
