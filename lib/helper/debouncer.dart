import 'package:flutter/foundation.dart';
import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer? _timer;
  bool _isWaiting = false;

  bool get isWaiting => _isWaiting;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _isWaiting = true;
    _timer = Timer(Duration(milliseconds: milliseconds), () {
      _isWaiting = false;
      action();
    });
  }

  dispose() {
    _timer?.cancel();
  }
}
