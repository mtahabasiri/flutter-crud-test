import 'package:flutter/material.dart';
import 'package:mc_crud_test/config/design_config.dart';
import 'package:mc_crud_test/config/theme_data.dart';
import 'package:mc_crud_test/views/widgets/text.dart';

class RayankarButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const RayankarButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 48,
      shape: const RoundedRectangleBorder(
        borderRadius: DesignConfig.lowBorderRadius,
      ),
      minWidth: double.infinity,
      color: Theme.of(context).colorScheme.primary,
      onPressed: onPressed,
      child: RayankarText(
        title,
        color: Theme.of(context).colorScheme.white,
      ),
    );
  }
}
