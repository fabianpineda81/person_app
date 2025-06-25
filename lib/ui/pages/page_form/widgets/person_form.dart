import 'package:app_personas/aplication/person/form/person_form_provider.dart';
import 'package:app_personas/domain/models/persons/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonForm extends ConsumerWidget{
  final Person? personToEdit;
  const PersonForm({super.key,required this.personToEdit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(personFormNotifierProvider);
    final formNotifier = ref.read(personFormNotifierProvider.notifier);
    final inputBorder = const OutlineInputBorder();

    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
              labelText: 'Primer Nombre',
              border: inputBorder,
              errorText: formState.firstNameError
          ),
          onChanged: formNotifier.onFirstNameChanged,
          initialValue: personToEdit?.firstName,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Segundo Nombre',
            border: inputBorder,
          ),
          onChanged: formNotifier.onMiddleNameChanged,
          initialValue: personToEdit?.middleName,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Primer Apellido',
            border: inputBorder,
            errorText: formState.lastNameError,
          ),
          onChanged: formNotifier.onLastNameChanged,
          initialValue: personToEdit?.lastName,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Segundo Apellido',
            border: inputBorder,
          ),
          onChanged: formNotifier.onSecondLastNameChanged,
          initialValue: personToEdit?.secondLastName,
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Tipo de identificación',
            border: inputBorder,
            errorText: formState.idTypeError,
          ),
          value: formState.idType.isEmpty ? null : formState.idType,
          items: const [
            DropdownMenuItem(value: 'CC', child: Text('Cédula de Ciudadanía')),
            DropdownMenuItem(value: 'TI', child: Text('Tarjeta de Identidad')),
            DropdownMenuItem(value: 'CE', child: Text('Cédula de Extranjería')),
            DropdownMenuItem(value: 'PA', child: Text('Pasaporte')),
            DropdownMenuItem(value: 'RC', child: Text('Registro Civil')),
            DropdownMenuItem(value: 'NIT', child: Text('NIT')),
          ],
          onChanged: (value) {
            formNotifier.onIdTypeChanged(value!);
          },
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Número de identificación',
            border: inputBorder,
            errorText: formState.idNumberError,
          ),
          onChanged: formNotifier.onIdNumberChanged,
          initialValue: personToEdit?.idNumber,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Correo electrónico',
            border: inputBorder,
          ),
          onChanged: formNotifier.onEmailChanged,
          initialValue:personToEdit?.email,
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Dirección',
            border: inputBorder,
          ),
          onChanged: formNotifier.onAddressChanged,
          initialValue: personToEdit?.address,
        ),
      ],
    );
  }

}

