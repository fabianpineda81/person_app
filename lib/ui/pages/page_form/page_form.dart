

import 'package:app_personas/aplication/person/form/person_form_provider.dart';
import 'package:app_personas/domain/models/persons/person.dart';
import 'package:app_personas/ui/pages/page_form/widgets/person_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormPage extends ConsumerWidget {
  final Person? personToEdit;
  const FormPage({super.key,this.personToEdit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final formState = ref.watch(personFormNotifierProvider);
    final formNotifier = ref.read(personFormNotifierProvider.notifier);
    if (personToEdit != null && !formState.wasInitialized) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(personFormNotifierProvider.notifier).initializeWithPerson(
            personToEdit!);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar persona'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            PersonForm(personToEdit: personToEdit),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:  () async {
               final success = await formNotifier.submitForm(editingId: personToEdit?.id);
                if (context.mounted && success) Navigator.pop(context);
              },
              child: formState.isSubmitting
                  ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
                  : const Text('Guardar'),
            )
          ],
        ),
      ),
    );
  }
}
