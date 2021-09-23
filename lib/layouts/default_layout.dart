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
  final String? pageName;

  const DefaultLayout({Key? key, this.appBar, this.body, this.pageName})
      : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 220,
                  decoration: BoxDecoration(color: AppColors.backgroundColor),
                  child: const MenuLeft()),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    pageName != null
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 16),
                            child: Text(
                              pageName!,
                              style: textPageTitle(context),
                            ),
                          )
                        : const SizedBox(),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: body ?? const SizedBox())
                  ],
                ),
              ))
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
        InkWell(
          onTap: () {
            NavigationService().pushNamed(loginRoute);
          },
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Nguyễn Văn A", style: textBoldLight(context)),
                const Icon(Icons.logout, color: Colors.white)
              ],
            ),
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
      NavigationService().pushNamed(routerName);
    },
    leading: Icon(iconData, color: Colors.white),
    title: Text(text, style: textLight(context)),
  );
}
