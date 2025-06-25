import 'package:app_personas/infrastructure/driven_adapter/local_database/isar/entities/person_isar.dart';
import 'package:app_personas/infrastructure/driven_adapter/local_database/isar/mappers/person_mapper.dart';
import 'package:isar/isar.dart';

import 'package:app_personas/domain/models/persons/gateway/person_gateway.dart';
import 'package:app_personas/domain/models/persons/person.dart';
import 'package:path_provider/path_provider.dart';

class PersonIsarRepository implements PersonGateway {
  late Future<Isar> _isar;


  PersonIsarRepository() : _isar = _initIsar();

  static Future<Isar> _initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [PersonIsarSchema],
      directory: dir.path,
      inspector: true,
    );
  }

  @override
  Future<void> addPerson(Person person) async {
    final isar = await _isar;
    final newPerson = person.toIsar();

    await isar.writeTxn(() async {
      await isar.personIsars.put(newPerson);
    });
  }

  @override
  Future<void> deletePerson(String id) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      final person = await isar.personIsars.filter().uuidEqualTo(id).findFirst();
      if (person != null) {
        await isar.personIsars.delete(person.id);
      }
    });
  }

  @override
  Future<List<Person>> getAllPersons() async {
    final isar = await _isar;
    final personsIsar = await isar.personIsars.where().findAll();
    return personsIsar.map((p) => p.toDomain()).toList();
  }

  @override
  Future<Person?> getPersonById(String id) async {
    final isar = await _isar;
    final personIsar = await isar.personIsars.filter().uuidEqualTo(id).findFirst();
    return personIsar?.toDomain();
  }

  @override
  Future<void> updatePerson(Person person) async {
    final isar = await _isar;
    final existing = await isar.personIsars.filter().uuidEqualTo(person.id!).findFirst();
    if (existing == null) return;

    final updated = person.toIsar();
    updated.id = existing.id;

    await isar.writeTxn(() async {
      await isar.personIsars.put(updated);
    });
  }
}
