import 'package:dating_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'bootstrap.dart';
import 'core/app/app.dart';
import 'core/bloc/app_bloc_observer_init.dart';
import 'core/di/dependency_injection_init.dart';
import 'core/init_adapter/init_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final initList = <InitAdapter>[
    DependencyInjectionInit(),
    AppBlocObserverInit(),
  ];

  bootstrap(() => App(), initList);
}
