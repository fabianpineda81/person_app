import 'package:app_personas/config/routes/app_routes.dart';
import 'package:app_personas/domain/models/persons/person.dart';
import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  final Person person;
  const PersonCard({super.key,required this.person});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text('${person.firstName} ${person.lastName}'),
        subtitle: Text('${person.idType}: ${person.idNumber}'),
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.detail,
            arguments: person.id,
          );
        },
      ),
    );
  }
}