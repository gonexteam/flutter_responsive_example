import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

enum FormFactorType { monitor, smallPhone, largePhone, tablet }

class DeviceOS {
  // Get Device info

  static bool isWeb = kIsWeb;

  static bool get isIOS => !isWeb && Platform.isIOS;

  static bool get isAndroid => !isWeb && Platform.isAndroid;

  static bool get isMacOS => !isWeb && Platform.isMacOS;

  static bool get isLinux => !isWeb && Platform.isLinux;

  static bool get isWindows => !isWeb && Platform.isWindows;

  static bool get isDesktop => isWindows || isMacOS || isLinux;

  static bool get isMobile => isAndroid || isIOS;

  static bool get isDesktopOrWeb => isDesktop || isWeb;

  static bool get isMobileOrWeb => isMobile || isWeb;
}

class DeviceScreen {
  // Get the device form factor as best we can.
  // Otherwise we will use the screen size to determine which class we fall into.
  static FormFactorType get(BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    if (shortestSide <= 300) return FormFactorType.smallPhone;
    if (shortestSide <= 600) return FormFactorType.largePhone;
    if (shortestSide <= 900) return FormFactorType.tablet;
    return FormFactorType.monitor;
  }

  static bool isPhone(BuildContext context) =>
      isSmallPhone(context) || isLargePhone(context);

  static bool isTablet(BuildContext context) =>
      get(context) == FormFactorType.tablet;

  static bool isMonitor(BuildContext context) =>
      get(context) == FormFactorType.monitor;

  static bool isSmallPhone(BuildContext context) =>
      get(context) == FormFactorType.smallPhone;

  static bool isLargePhone(BuildContext context) =>
      get(context) == FormFactorType.largePhone;
}
