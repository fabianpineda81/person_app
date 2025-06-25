

import 'package:equatable/equatable.dart';
const _noUpdate = Object();
class PersonFormState extends Equatable {
  final String firstName;
  final String middleName;
  final String lastName;
  final String secondLastName;
  final String idType;
  final String idNumber;
  final String email;
  final String address;
  final bool isValid;
  final bool isSubmitting;
  final String? firstNameError;
  final String? lastNameError;
  final String? idTypeError;
  final String? idNumberError;
  final String? emailError;
  final String? addressError;
  final bool wasInitialized;

  const PersonFormState({
    this.firstName = '',
    this.middleName = '',
    this.lastName = '',
    this.secondLastName = '',
    this.idType = '',
    this.idNumber = '',
    this.email = '',
    this.address = '',
    this.isValid = false,
    this.isSubmitting = false,
    this.firstNameError,
    this.lastNameError,
    this.idTypeError,
    this.idNumberError,
    this.emailError,
    this.addressError,
    this.wasInitialized = false,
  });

  PersonFormState copyWith({
    String? firstName,
    String? middleName,
    String? lastName,
    String? secondLastName,
    String? idType,
    String? idNumber,
    String? email,
    String? address,
    bool? isValid,
    bool? isSubmitting,
    bool? wasInitialized,
    Object? firstNameError = _noUpdate,
    Object? lastNameError = _noUpdate,
    Object? idTypeError = _noUpdate,
    Object? idNumberError = _noUpdate,
    Object? emailError = _noUpdate,
    Object? addressError = _noUpdate,
  }) {
    return PersonFormState(
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      secondLastName: secondLastName ?? this.secondLastName,
      idType: idType ?? this.idType,
      idNumber: idNumber ?? this.idNumber,
      email: email ?? this.email,
      address: address ?? this.address,
      isValid: isValid ?? this.isValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      wasInitialized: wasInitialized ?? this.wasInitialized,
      firstNameError: firstNameError == _noUpdate ? this.firstNameError : firstNameError as String?,
      lastNameError: lastNameError == _noUpdate ? this.lastNameError : lastNameError as String?,
      idTypeError: idTypeError == _noUpdate ? this.idTypeError : idTypeError as String?,
      idNumberError: idNumberError == _noUpdate ? this.idNumberError : idNumberError as String?,
      emailError: emailError == _noUpdate ? this.emailError : emailError as String?,
      addressError: addressError == _noUpdate ? this.addressError : addressError as String?,
    );
  }


  @override
  List<Object?> get props => [
    firstName,
    middleName,
    lastName,
    secondLastName,
    idType,
    idNumber,
    email,
    address,
    isValid,
    isSubmitting,
    firstNameError,
    lastNameError,
    idTypeError,
    idNumberError,
    emailError,
    addressError,
  ];

}
