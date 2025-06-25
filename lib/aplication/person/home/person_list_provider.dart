import 'package:app_personas/aplication/person/home/person_list_notifier.dart';
import 'package:app_personas/config/providers/get_all_persons_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:app_personas/domain/models/persons/person.dart';

final personListProvider = StateNotifierProvider<PersonListNotifier, List<Person>>((ref) {
  final getAll = ref.watch(getAllPersonsUseCaseProvider);

  return PersonListNotifier(getAll);
});
