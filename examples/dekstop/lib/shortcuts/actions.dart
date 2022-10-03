import 'package:flutter/material.dart';

import 'shortcuts.dart';

class EscapeAction extends Action<EscapeIntent> {
  EscapeAction({
    required this.function,
  });

  final VoidCallback function;

  @override
  void invoke(covariant EscapeIntent intent) {
    function();
    // if (Navigator.of(context).canPop()) {
    //   Navigator.of(context).pop();
    // }
  }
}
