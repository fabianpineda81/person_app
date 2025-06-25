import 'package:app_personas/aplication/person/form/person_form_notifier.dart';
import 'package:app_personas/aplication/person/form/person_form_state.dart';
import 'package:app_personas/aplication/person/home/person_list_provider.dart';
import 'package:app_personas/config/providers/add_person_provider.dart';
import 'package:app_personas/config/providers/update_person_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final personFormNotifierProvider = StateNotifierProvider.autoDispose<PersonFormNotifier, PersonFormState>((ref) {
  final add = ref.watch(addPersonUseCaseProvider);
  final update = ref.watch(updatePersonUseCaseProvider);
  final personListNotifier = ref.watch(personListProvider.notifier);
  return PersonFormNotifier(personListNotifier,add,update);
});
