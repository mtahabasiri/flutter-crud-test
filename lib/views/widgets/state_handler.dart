import 'package:flutter/material.dart';
import 'package:mc_crud_test/models/enums.dart';
import 'package:mc_crud_test/providers/core_provider.dart';

class StateHandler<T extends CoreProvier> extends StatelessWidget {
  final T state;
  final Widget Function(BuildContext context, T state) builder;
  final VoidCallback onRetry;
  final bool enableEmptyState;
  final Widget? placeholder;
  final Widget? emptyState;
  final double topPadding;
  const StateHandler({
    Key? key,
    required this.builder,
    required this.onRetry,
    required this.state,
    this.emptyState,
    this.enableEmptyState = false,
    this.topPadding = 0,
    this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (enableEmptyState && state.appState == AppState.idle) {
      return Container(
        padding: EdgeInsets.only(top: topPadding),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: emptyState ?? const Text('Custom Widget Required!'),
        ),
      );
    }
    switch (state.appState) {
      case AppState.idle:
        return builder(context, state);
      case AppState.busy:
        return placeholder ?? const CircularProgressIndicator();
      case AppState.failed:
        //Error handling
        return const SizedBox();
      default:
        return Container();
    }
  }
}
