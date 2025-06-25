
import 'package:app_personas/domain/models/persons/person.dart';

abstract class PersonGateway {
  Future<List<Person>> getAllPersons();
  Future<void> addPerson(Person person);
  Future<void> updatePerson(Person person);
  Future<void> deletePerson(String id);
  Future<Person?> getPersonById(String id);
}