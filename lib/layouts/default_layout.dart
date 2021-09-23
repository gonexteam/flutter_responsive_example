import 'package:flutter/material.dart';
import 'package:flutter_responsive/config/colors.dart';
import 'package:flutter_responsive/config/style.dart';
import 'package:flutter_responsive/helpers/device_helper.dart';
import 'package:flutter_responsive/helpers/ui_helper.dart';
import 'package:flutter_responsive/routing/router_names.dart';
import 'package:flutter_responsive/services/navigation_service.dart';

class DefaultLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;

  const DefaultLayout({Key? key, this.appBar, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final bool _mobileMode =
          DeviceOS.isMobile || DeviceScreen.isPhone(context);
      if (_mobileMode) {
        return Scaffold(
          appBar: appBar,
          body: body,
        );
      } else {
        return Scaffold(
          body: Row(
            children: [
              Container(
                  width: 220,
                  decoration: BoxDecoration(color: AppColors.backgroundColor),
                  child: const MenuLeft()),
              Expanded(child: body ?? const SizedBox())
            ],
          ),
        );
      }
    });
  }
}

class MenuLeft extends StatelessWidget {
  const MenuLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView(
          children: [
            _menuItem(context, Icons.dashboard, "Dashboard", homeRoute),
            UIHelper.customSeparator(),
            _menuItem(
                context, Icons.accessibility_outlined, "About", aboutRoute)
          ],
        )),
        UIHelper.customSeparator(),
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Nguyễn Văn A", style: textBoldLight(context)),
              const Icon(Icons.logout, color: Colors.white)
            ],
          ),
        )
      ],
    );
  }
}

Widget _menuItem(
    BuildContext context, IconData iconData, String text, String routerName) {
  return ListTile(
    onTap: () {
      NavigationService().pushNamed(homeRoute);
    },
    leading: Icon(iconData, color: Colors.white),
    title: Text(text, style: textLight(context)),
  );
}
