import 'package:app_personas/aplication/person/detail/person_detail_provider.dart';
import 'package:app_personas/config/routes/app_routes.dart';
import 'package:app_personas/domain/models/persons/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPerson extends ConsumerWidget {
  final Person person;

  const DetailPerson({super.key, required this.person});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(personDetailProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de Persona')),
      body:isLoading ? const Center(child: CircularProgressIndicator()):  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: ${person.firstName} ${person.middleName}', style: const TextStyle(fontSize: 16)),
            Text('Apellido: ${person.lastName} ${person.secondLastName}', style: const TextStyle(fontSize: 16)),
            Text('Tipo de ID: ${person.idType}', style: const TextStyle(fontSize: 16)),
            Text('Número de ID: ${person.idNumber}', style: const TextStyle(fontSize: 16)),
            Text('Correo: ${person.email}', style: const TextStyle(fontSize: 16)),
            Text('Dirección: ${person.address}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.form,
                      arguments: person,
                    );

                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Editar'),
                ),
                ElevatedButton.icon(
                  onPressed:() async {
                      final result=  await showConfirmDeleteDialog(context);
                      if(result){
                        await ref.read(personDetailProvider.notifier).deletePerson(person.id);
                        if (context.mounted) Navigator.pop(context);
                      }
                  },
                  icon: const Icon(Icons.delete),
                  label: const Text('Eliminar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<bool> showConfirmDeleteDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('¿Confirmar eliminación?'),
      content: const Text('Esta acción no se puede deshacer.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text(
            'Eliminar',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ),
  );


  return result ?? false;
}

