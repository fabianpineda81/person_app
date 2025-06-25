import 'package:app_personas/aplication/person/home/person_list_notifier.dart';
import 'package:app_personas/domain/models/persons/person.dart';
import 'package:app_personas/domain/use_cases/person/delete_person.dart';
import 'package:app_personas/domain/use_cases/person/get_person_by_id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonDetailNotifier extends StateNotifier<bool> {
  final PersonListNotifier personListNotifier;
  final DeletePersonUseCase _delete;
  final GetPersonByIdUseCase _getPerson;

  PersonDetailNotifier(this._getPerson,this.personListNotifier,this._delete):super(false);

  Future<void> deletePerson(String id) async {
    state=true;
    await _delete.execute(id);
    personListNotifier.loadPersons();
    state=false;
  }
  Future<Person?> getPersonById(String id) async {
    final person = await _getPerson.execute(id);
    return person;
  }



}