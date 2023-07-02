import 'package:flutter/material.dart';

extension CustomDebugPrint on String {
  void greenPrint() {
    debugPrint('\u001b[32m$this\u001b[0m');
  }
}
