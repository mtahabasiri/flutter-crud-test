import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mc_crud_test/config/design_config.dart';

class ActionSheetUtils {
  static late BuildContext context;

  static Future<void> showLoadingIndicator() async {
    await showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void pop() {
    DesignConfig.updateSystemUiOverlayStyle();
    Navigator.of(context).pop();
  }

  static Future<DateTime?> openDatePicker() async {
    final result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    return result;
  }
}
