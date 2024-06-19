import 'package:flutter/widgets.dart';

extension PageExtensions on Widget {
  Widget blockBackPopScope() => PopScope(
        canPop: false,
        child: this,
      );
}
