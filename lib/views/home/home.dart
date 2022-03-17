import 'package:flutter/material.dart';
import 'package:mc_crud_test/config/theme_data.dart';
import 'package:mc_crud_test/routing/routes.dart';
import 'package:mc_crud_test/views/widgets/rayankar_button.dart';
import 'package:mc_crud_test/views/widgets/text.dart';
import 'package:mc_crud_test/views/widgets/text_field.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ََCustomer Management Service'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(Routes.userForm),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
