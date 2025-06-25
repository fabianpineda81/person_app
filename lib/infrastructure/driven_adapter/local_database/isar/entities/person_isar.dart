import 'package:isar/isar.dart';

part 'person_isar.g.dart';

@collection
class PersonIsar {
  Id id = Isar.autoIncrement;
  late String uuid;
  late String firstName;
  String? middleName;
  late String lastName;
  String? secondLastName;
  late String idType;
  late String idNumber;
  late String email;
  late String address;
}
