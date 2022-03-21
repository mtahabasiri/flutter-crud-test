import 'package:collection/collection.dart';
import 'package:hive/hive.dart';
import 'package:fixnum/fixnum.dart';

part 'customer.g.dart';

@HiveType(typeId: 1)
class Customer {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final String dateOfBirth;
  @HiveField(3)
  final Int64 phoneNumber;
  @HiveField(4)
  final String email;
  @HiveField(5)
  final String bankAccountNumber;

  const Customer({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
    required this.bankAccountNumber,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        firstName: json['firstName'],
        lastName: json['lastName'],
        dateOfBirth: json['dateOfBirth'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        bankAccountNumber: json['bankAccountNumber'],
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth,
        'phoneNumber': phoneNumber,
        'email': email,
        'bankAccountNumber': bankAccountNumber,
      };

  Customer copyWith({
    String? firstName,
    String? lastName,
    String? dateOfBirth,
    Int64? phoneNumber,
    String? email,
    String? bankAccountNumber,
  }) {
    return Customer(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Customer) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      firstName.hashCode ^
      lastName.hashCode ^
      dateOfBirth.hashCode ^
      phoneNumber.hashCode ^
      email.hashCode ^
      bankAccountNumber.hashCode;
}
