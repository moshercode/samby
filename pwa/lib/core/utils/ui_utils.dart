import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

abstract class UIUtils {
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.shortestSide >= 600;

  static bool isLandscape(BuildContext context) => MediaQuery.of(context).orientation == Orientation.landscape;

  static void performActionOnPostFrameCallback(VoidCallback action) {
    SchedulerBinding.instance.addPostFrameCallback((_) => action());
  }
}
