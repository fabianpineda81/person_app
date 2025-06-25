import 'package:app_personas/domain/models/persons/gateway/person_gateway.dart';
import 'package:app_personas/domain/models/persons/person.dart';

class AddPersonUseCase {
  final PersonGateway gateway;

  AddPersonUseCase(this.gateway);

  Future<void> execute(Person person) {
    return gateway.addPerson(person);
  }
}