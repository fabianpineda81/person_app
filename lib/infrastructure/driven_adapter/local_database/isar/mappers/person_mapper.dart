import 'package:app_personas/domain/models/persons/person.dart';
import 'package:app_personas/infrastructure/driven_adapter/local_database/isar/entities/person_isar.dart';


extension PersonMapper on PersonIsar {
  Person toDomain() {
    return Person(
      id: uuid,
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      secondLastName: secondLastName,
      idType: idType,
      idNumber: idNumber,
      email: email,
      address: address,
    );
  }
}

extension PersonDomainMapper on Person {
  PersonIsar toIsar() {
    final isar = PersonIsar()
      ..uuid = id
      ..firstName = firstName
      ..middleName = middleName
      ..lastName = lastName
      ..secondLastName = secondLastName
      ..idType = idType
      ..idNumber = idNumber
      ..email = email
      ..address = address;
    return isar;
  }
}
