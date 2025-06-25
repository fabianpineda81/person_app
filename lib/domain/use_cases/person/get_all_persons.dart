import 'package:app_personas/domain/models/persons/gateway/person_gateway.dart';
import 'package:app_personas/domain/models/persons/person.dart';

class GetAllPersonsUseCase {
  final PersonGateway gateway;

  GetAllPersonsUseCase(this.gateway);

  Future<List<Person>> execute() {
    return gateway.getAllPersons();
  }
}