import 'package:app_personas/domain/models/persons/gateway/person_gateway.dart';
import 'package:app_personas/infrastructure/driven_adapter/local_database/isar/repositories/person_isar_repository.dart';
import 'package:app_personas/infrastructure/driven_adapter/memory/person_in_memory_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final personRepositoryProvider = Provider<PersonGateway>((ref) {
  return PersonIsarRepository();
});