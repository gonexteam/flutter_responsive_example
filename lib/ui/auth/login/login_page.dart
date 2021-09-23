import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_responsive/config/colors.dart';
import 'package:flutter_responsive/helpers/device_helper.dart';

import 'login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool _mobileMode =
              DeviceOS.isMobile || DeviceScreen.isPhone(context);
          return _mobileMode ? buildMobile(context) : buildLarger(context);
        },
      ),
    );
  }
}
