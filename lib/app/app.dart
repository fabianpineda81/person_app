import 'package:app_personas/aplication/person/home/person_list_provider.dart';
import 'package:app_personas/domain/models/persons/person.dart';
import 'package:app_personas/ui/pages/detail_page/detail_page.dart';
import 'package:app_personas/ui/pages/home_page/home_page.dart';
import 'package:app_personas/ui/pages/page_form/page_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/routes/app_routes.dart';

class AppPersonas extends ConsumerWidget{
  const AppPersonas({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      title: 'App Personas',
      onGenerateRoute: (settings){
        switch(settings.name){
          case AppRoutes.home:
            return MaterialPageRoute(builder: (context) =>  HomePage(persons: ref.watch(personListProvider)));
          case AppRoutes.detail:
            final id = settings.arguments as String;
            return MaterialPageRoute(builder: (_) => DetailPage(personId: id));

          case AppRoutes.form:
            final person = settings.arguments as Person?;
            return MaterialPageRoute(
              builder: (context) => FormPage(personToEdit: person),
            );
          default:
            return MaterialPageRoute(builder: (context) =>  HomePage(persons: ref.watch(personListProvider)));
        }
      }
    );
  }
}