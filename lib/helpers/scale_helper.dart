import 'package:flutter/cupertino.dart';

class ScaleHelper {
  static late Size _size; // Design size
  static late Size _deviceScreenSize; // Device Size

  static init(BuildContext context, Size screenSize) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    _deviceScreenSize = mediaQuery.size;
    _size = screenSize;
  }

  static num get _ratioWidth => _deviceScreenSize.width / _size.width;

  static num get _ratioHeight => _deviceScreenSize.height / _size.height;

  /// sy => height [value] get scale height
  static double sy(num value) {
    return (value * _ratioHeight).toDouble();
  }

  /// sx => width [value] get scale with
  static double sx(num value) {
    return (value * _ratioWidth).toDouble();
  }

  /// sx => fontSize [value] get scale font
  static double sf(num value) {
    return (value * _ratioWidth).toDouble();
  }

  /// sx => fontSize [value] get scale font
  static double get fontScale => _ratioWidth.toDouble();
}

extension ScaleUI on num {
  double get sh => ScaleHelper.sy(this);

  double get sw => ScaleHelper.sx(this);

  double get sf => ScaleHelper.sf(this);
}
