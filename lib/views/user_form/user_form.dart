import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mc_crud_test/config/theme_data.dart';
import 'package:mc_crud_test/models/customer.dart';
import 'package:mc_crud_test/utils/action_sheet.dart';
import 'package:mc_crud_test/utils/validator.dart';
import 'package:mc_crud_test/views/home/home_state.dart';
import 'package:mc_crud_test/views/widgets/rayankar_button.dart';
import 'package:mc_crud_test/views/widgets/text.dart';
import 'package:mc_crud_test/views/widgets/text_field.dart';
import 'package:provider/provider.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({Key? key}) : super(key: key);

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? bankAccountNumber;
  DateTime? dateOfBirth;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RayankarText(
          'User Form',
          color: Theme.of(context).colorScheme.white,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RayankarTextField(
                onChanged: (value) => firstName = value,
                validator: (value) => Validator.lengthValidator(
                  value: value,
                  length: 3,
                ),
                title: 'First Name:',
                hintText: 'John',
              ),
              const SizedBox(height: 16),
              RayankarTextField(
                onChanged: (value) => lastName = value,
                validator: (value) => Validator.lengthValidator(
                  value: value,
                  length: 3,
                ),
                title: 'Last Name:',
                hintText: 'Doe',
              ),
              const SizedBox(height: 16),
              RayankarTextField(
                onChanged: (value) => email = value,
                validator: (value) => Validator.lengthValidator(
                  value: value,
                  length: 3,
                ),
                title: 'Email:',
                hintText: 'example@foo.com',
              ),
              const SizedBox(height: 16),
              const RayankarText('Date of Birth:'),
              const SizedBox(height: 8),
              Localizations(
                delegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: const Locale('en'),
                child: RayankarButton(
                  title: dateOfBirth == null
                      ? 'Choose'
                      : dateOfBirth.toString().split(' ').first,
                  onPressed: _showDatePicker,
                ),
              ),
              const SizedBox(height: 16),
              RayankarTextField(
                onChanged: (value) => phoneNumber = value,
                validator: (value) => Validator.lengthValidator(
                  value: value,
                  length: 3,
                ),
                title: 'Phone Number:',
                hintText: 'Your Phone No.',
              ),
              const SizedBox(height: 16),
              RayankarTextField(
                onChanged: (value) => bankAccountNumber = value,
                validator: (value) => Validator.lengthValidator(
                  value: value,
                  length: 16,
                ),
                title: 'Bank Account:',
                hintText: 'Bank Account No.',
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitForm,
        child: const Icon(Icons.check),
      ),
    );
  }

  Future<void> _submitForm() async {
    final state = context.read<HomeState>();
    state.addCustomer(Customer(
      firstName: firstName!,
      lastName: lastName!,
      dateOfBirth: dateOfBirth.toString(),
      phoneNumber: Int64(int.parse(phoneNumber!)),
      email: email!,
      bankAccountNumber: bankAccountNumber!,
    ));
  }

  Future<void> _showDatePicker() async {
    dateOfBirth = await ActionSheetUtils.openDatePicker();
    setState(() {});
  }
}
