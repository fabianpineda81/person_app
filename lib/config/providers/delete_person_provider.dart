import 'package:app_personas/config/providers/person_repository_provider.dart';
import 'package:app_personas/domain/use_cases/person/delete_person.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deletePersonUseCaseProvider = Provider<DeletePersonUseCase>((ref) {
  return DeletePersonUseCase(ref.watch(personRepositoryProvider));
});