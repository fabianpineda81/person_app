import 'package:app_personas/config/routes/app_routes.dart';
import 'package:app_personas/domain/models/persons/person.dart';
import 'package:app_personas/ui/pages/home_page/widgets/list_persons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomePage extends ConsumerWidget {
  final  List<Person> persons;
  const HomePage({super.key,required this.persons});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de personas'),
      ),
      body: ListPerson(persons: persons),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.form);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
