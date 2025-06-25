import 'package:app_personas/config/providers/person_repository_provider.dart';
import 'package:app_personas/domain/use_cases/person/get_person_by_id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getPersonByIdUseCaseProvider = Provider<GetPersonByIdUseCase>((ref) {
  return GetPersonByIdUseCase(ref.watch(personRepositoryProvider));
});