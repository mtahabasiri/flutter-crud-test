import 'package:flutter/material.dart';
import 'package:mc_crud_test/routing/routes.dart';
import 'package:mc_crud_test/views/home/home.dart';
import 'package:mc_crud_test/views/home/home_state.dart';
import 'package:mc_crud_test/views/user_form/user_form.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return _createRoute(
          ChangeNotifierProvider<HomeState>(
            create: (context) => HomeState(),
            child: const Home(),
          ),
        );
      case Routes.userForm:
        return _createRoute(
          ChangeNotifierProvider<HomeState>.value(
            value: settings.arguments as HomeState,
            child: const CustomerForm(),
          ),
        );
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
