import 'package:app_personas/domain/models/persons/gateway/person_gateway.dart';

class DeletePersonUseCase {
  final PersonGateway gateway;

  DeletePersonUseCase(this.gateway);

  Future<void> execute(String id) {
    return gateway.deletePerson(id);
  }
}