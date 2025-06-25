import 'package:app_personas/app/app.dart';
import 'package:app_personas/infrastructure/driven_adapter/local_database/isar/entities/person_isar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const ProviderScope(child: AppPersonas()));
}

