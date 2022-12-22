import 'package:flutter/cupertino.dart';

extension ScreenWidth on BuildContext {
  bool isTablet() {
    return MediaQuery.of(this).size.width >= 600;
  }
}
