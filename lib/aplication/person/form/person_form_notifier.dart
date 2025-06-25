
import 'package:app_personas/aplication/person/home/person_list_notifier.dart';
import 'package:app_personas/domain/models/persons/person.dart';
import 'package:app_personas/domain/use_cases/person/add_person.dart';
import 'package:app_personas/domain/use_cases/person/update_person.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'person_form_state.dart';

class PersonFormNotifier extends StateNotifier<PersonFormState> {
  final PersonListNotifier personListNotifier;
  final AddPersonUseCase _add;
  final UpdatePersonUseCase _update;


  PersonFormNotifier(this.personListNotifier,this._add,this._update) : super(PersonFormState());

  void onFirstNameChanged(String value) {
    state = state.copyWith(firstName: value,firstNameError: null);

  }

  void onLastNameChanged(String value) {
    state = state.copyWith(lastName: value,lastNameError: null);

  }

  void onIdTypeChanged(String value) {
    state = state.copyWith(idType: value,idTypeError: null);

  }

  void onIdNumberChanged(String value) {
    state = state.copyWith(idNumber: value,idNumberError: null);

  }

  void onMiddleNameChanged(String value) {
    state = state.copyWith(middleName: value,);

  }

  void onSecondLastNameChanged(String value) {
    state = state.copyWith(secondLastName: value);

  }

  void onEmailChanged(String value) {
    state = state.copyWith(email: value,emailError: null);

  }

  void onAddressChanged(String value) {
    state = state.copyWith(address: value,);

  }

  void _validate() {
    final isValid = state.firstName.isNotEmpty &&
        state.lastName.isNotEmpty &&
        state.idType.isNotEmpty &&
        state.idNumber.isNotEmpty;

    if (isValid) {
      clearErrors();
    } else {
      if (state.firstName.isEmpty) {
        state = state.copyWith(firstNameError: 'El primer nombre es requerido');
      }
      if (state.lastName.isEmpty) {
        state = state.copyWith(lastNameError: 'El primer apellido es requerido');
      }
      if (state.idType.isEmpty) {
        state = state.copyWith(idTypeError: 'El tipo de identificación es requerido');
      }
      if (state.idNumber.isEmpty) {
        state = state.copyWith(idNumberError: 'El número de identificación es requerido');
      }
    }
    state = state.copyWith(isValid: isValid);
  }

  Future<bool> submitForm({String? editingId}) async {
    _validate();
    if (!state.isValid || state.isSubmitting) return false ;

    state = state.copyWith(isSubmitting: true);
    final Uuid uuid = const Uuid();
    final person = Person(
      id: editingId??uuid.v4() ,
      firstName: state.firstName,
      middleName: state.middleName,
      lastName: state.lastName,
      secondLastName: state.secondLastName,
      idType: state.idType,
      idNumber: state.idNumber,
      email: state.email,
      address: state.address,
    );
    if (editingId == null) {
      await _add.execute(person);
    }else{
      await _update.execute(person);
    }

    await personListNotifier.loadPersons();
    state = PersonFormState();
    return true;
  }


  void clearErrors() {
    state= state.copyWith(
      firstNameError: null,
      lastNameError: null,
      idTypeError: null,
      idNumberError: null,
      emailError: null,
      addressError: null,
    );
  }

  void initializeWithPerson(Person person) {
    state = state.copyWith(
      firstName: person.firstName,
      middleName: person.middleName,
      lastName: person.lastName,
      secondLastName: person.secondLastName,
      idType: person.idType,
      idNumber: person.idNumber,
      email: person.email,
      address: person.address,
      wasInitialized: true,
    );
  }
}
