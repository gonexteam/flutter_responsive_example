import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_responsive/routing/router.dart';
import 'package:flutter_responsive/routing/router_names.dart';
import 'package:flutter_responsive/services/navigation_service.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: NavigationService.navigationKey,
      onGenerateRoute: generateRoute,
      initialRoute: loginRoute,
    );
  }
}
