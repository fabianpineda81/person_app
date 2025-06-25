import 'package:app_personas/aplication/person/detail/person_detail_notifier.dart';
import 'package:app_personas/aplication/person/home/person_list_provider.dart';
import 'package:app_personas/config/providers/delete_person_provider.dart';
import 'package:app_personas/config/providers/get_person_by_id_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final personDetailProvider = StateNotifierProvider<PersonDetailNotifier,bool>((ref)  {
  final delete = ref.watch(deletePersonUseCaseProvider);
  final personListNotifier = ref.watch(personListProvider.notifier);
  final getPerson = ref.watch(getPersonByIdUseCaseProvider);
  return PersonDetailNotifier(getPerson,personListNotifier,delete);
});