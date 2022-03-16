import 'package:flutter/material.dart';
import 'package:mc_crud_test/routing/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return _createRoute(Container());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }

  static Route _createRoute(page) {
    return MaterialPageRoute(
      builder: (context) => SafeArea(
        child: page,
        top: false,
      ),
    );
  }
}
