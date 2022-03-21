import 'package:hive_flutter/hive_flutter.dart';
import 'package:mc_crud_test/models/customer.dart';
import 'package:mc_crud_test/models/enums.dart';
import 'package:mc_crud_test/providers/core_provider.dart';
import 'package:mc_crud_test/services/storage.dart';

class HomeState extends CoreProvier {
  final List<Customer> customers = [];

  Future<void> init() async {
    appState = AppState.busy;
    await Hive.initFlutter();
    await _getCustomers();
  }

  Future<void> _getCustomers() async {
    final data = await StorageService.get(boxName: 'customers', key: 'list');
    customers.addAll(data ?? []);
  }

  Future<void> addCustomer(Customer customer) async {
    appState = AppState.isolatedBusy;
  }
}
