import 'package:app_personas/config/routes/app_routes.dart';
import 'package:app_personas/domain/models/persons/person.dart';
import 'package:app_personas/ui/pages/home_page/widgets/person_card.dart';
import 'package:flutter/material.dart';

class ListPerson extends StatelessWidget {
  final List<Person> persons;
  const ListPerson({super.key, required this.persons});

  @override
  Widget build(BuildContext context) {
    if (persons.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'No hay personas registradas.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.form); // Asegúrate que la ruta esté bien
              },
              icon: const Icon(Icons.add),
              label: const Text('Agregar persona'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: persons.length,
      itemBuilder: (context, index) {
        final person = persons[index];
        return PersonCard(person: person);
      },
    );
  }
}
