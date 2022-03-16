import 'package:flutter/material.dart';
import 'package:mc_crud_test/config/theme_data.dart';

void main() {
  runApp(const Rayankar());
}

final navigatorKey = GlobalKey<NavigatorState>();

class Rayankar extends StatelessWidget {
  const Rayankar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: navigatorKey,
      title: 'Rayankar',
      theme: ThemeConfig.themeData,
      initialRoute: '/home',
    );
  }
}
