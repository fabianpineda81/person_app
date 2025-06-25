import 'package:app_personas/domain/models/persons/gateway/person_gateway.dart';
import 'package:app_personas/domain/models/persons/person.dart';
import 'package:uuid/uuid.dart';


class PersonInMemoryRepository implements PersonGateway {
  final List<Person> _persons = [];
  final Uuid _uuid = const Uuid();

  @override
  Future<void> addPerson(Person person) async {
    final newPerson = person.copyWith(id: _uuid.v4());
    _persons.add(newPerson);
  }

  @override
  Future<void> deletePerson(String id) async {
    _persons.removeWhere((p) => p.id == id);
  }

  @override
  Future<List<Person>> getAllPersons() async {
    return _persons;
  }

  @override
  Future<Person?> getPersonById(String id) async {
    for (final person in _persons) {
      if (person.id == id) {
        return person;
      }
    }
    return null;
  }


  @override
  Future<void> updatePerson(Person person) async {
    final index = _persons.indexWhere((p) => p.id == person.id);
    if (index != -1) {
      _persons[index] = person;
    }
  }
}
