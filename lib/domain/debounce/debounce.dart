import 'dart:async';

class Debouncer {
  final int milliseconds;
  void Function()? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(void Function() action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
