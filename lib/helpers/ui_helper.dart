import 'package:flutter/material.dart';

class UIHelper {
 static Widget vertical({double size = 8}) => SizedBox(height: size);

 static Widget horizontal({double size = 8}) => SizedBox(width: size);

 static Widget customSeparator({Color color = Colors.white12}) => const Divider(color: Colors.white12, height: 0.15);
}
