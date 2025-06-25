
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_personas/domain/models/persons/person.dart';
import 'package:app_personas/domain/use_cases/person/get_all_persons.dart';

class PersonListNotifier extends StateNotifier<List<Person>> {
  final GetAllPersonsUseCase _getAll;

  PersonListNotifier(
      this._getAll,
      ) : super([]) {
    loadPersons();
  }

  Future<void > loadPersons() async {
    final persons = await _getAll.execute();
    state = [...persons];

  }



}
