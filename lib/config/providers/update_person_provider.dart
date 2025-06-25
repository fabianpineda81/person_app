import 'package:app_personas/config/providers/person_repository_provider.dart';
import 'package:app_personas/domain/use_cases/person/update_person.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updatePersonUseCaseProvider = Provider<UpdatePersonUseCase>((ref) {
  return UpdatePersonUseCase(ref.watch(personRepositoryProvider));
});