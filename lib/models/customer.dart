import 'package:collection/collection.dart';

class Customer {
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  final String? phoneNumber;
  final String? email;
  final String? bankAccountNumber;

  const Customer({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.phoneNumber,
    this.email,
    this.bankAccountNumber,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        dateOfBirth: json['dateOfBirth'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        email: json['email'] as String?,
        bankAccountNumber: json['bankAccountNumber'] as String?,
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
    String? phoneNumber,
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
