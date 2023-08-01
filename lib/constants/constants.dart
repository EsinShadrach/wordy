import 'package:flutter/material.dart';

extension GreenPrint on String {
  void greenPrint() {
    debugPrint('\u001b[32m$this\u001b[0m');
  }
}

void greenPrint(text) {
  debugPrint('\u001b[32m$text\u001b[0m');
}

void redPrint(text) {
  debugPrint('\u001b[31m$text\u001b[0m');
}
