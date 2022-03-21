import 'package:flutter/material.dart';
import 'package:mc_crud_test/main.dart';
import 'package:mc_crud_test/routing/routes.dart';
import 'package:mc_crud_test/utils/action_sheet.dart';
import 'package:mc_crud_test/views/home/home_state.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    ActionSheetUtils.context = navigatorKey.currentContext!;
    Future.delayed(Duration.zero, context.read<HomeState>().init);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ََCustomer Management Service'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          Routes.userForm,
          arguments: context.read<HomeState>(),
        ),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
