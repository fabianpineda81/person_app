import 'package:app_personas/aplication/person/detail/person_detail_provider.dart';
import 'package:app_personas/ui/pages/detail_page/widgets/detail_person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  final String personId;
  const DetailPage({super.key, required this.personId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personFuture = ref.read(personDetailProvider.notifier).getPersonById(personId);

    return FutureBuilder(
      future: personFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final person = snapshot.data ;
        if (person == null) {
          return const Scaffold(body: Center(child: Text('Persona no encontrada')));
        }

        return DetailPerson(person: person);
      },
    );
  }
}
