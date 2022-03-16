import 'package:flutter/cupertino.dart';
import 'package:mc_crud_test/models/enums.dart';
import 'package:mc_crud_test/utils/action_sheet.dart';

class CoreProvier with ChangeNotifier {
  AppState _appState = AppState.idle;

  set appState(AppState newState) {
    if (newState == AppState.isolatedBusy) {
      ActionSheetUtils.showLoadingIndicator();
    }
    if (_appState == AppState.isolatedBusy) {
      ActionSheetUtils.pop();
    }
    _appState = newState;
    notifyListeners();
  }

  void update() => notifyListeners();

  AppState get appState => _appState;
}
