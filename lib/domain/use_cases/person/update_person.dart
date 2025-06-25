import 'package:app_personas/domain/models/persons/gateway/person_gateway.dart';
import 'package:app_personas/domain/models/persons/person.dart';

class UpdatePersonUseCase {
  final PersonGateway gateway;

  UpdatePersonUseCase(this.gateway);

  Future<void> execute(Person person) {
    return gateway.updatePerson(person);
  }
}