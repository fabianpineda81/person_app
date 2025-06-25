import 'package:app_personas/domain/models/persons/gateway/person_gateway.dart';
import 'package:app_personas/domain/models/persons/person.dart';

class GetPersonByIdUseCase {
  final PersonGateway gateway;

  GetPersonByIdUseCase(this.gateway);

  Future<Person?> execute(String id) {
    return gateway.getPersonById(id);
  }
}