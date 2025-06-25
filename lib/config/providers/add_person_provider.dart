import 'package:app_personas/config/providers/person_repository_provider.dart';
import 'package:app_personas/domain/use_cases/person/add_person.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addPersonUseCaseProvider = Provider<AddPersonUseCase>((ref) {
  return AddPersonUseCase(ref.watch(personRepositoryProvider));
});