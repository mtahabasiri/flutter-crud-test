import 'package:flutter/material.dart';
import 'package:mc_crud_test/config/theme_data.dart';
import 'package:mc_crud_test/routing/route_generator.dart';

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
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
