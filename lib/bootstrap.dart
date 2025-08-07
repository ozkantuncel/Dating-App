import 'dart:async';
import 'dart:developer';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'core/authorization/secure_storage_service.dart';
import 'core/authorization/shared_preferences_service.dart';
import 'core/init_adapter/init_adapter.dart';
import 'injection_container.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
  List<InitAdapter> initAdapterList,
) async {
  initFlutterLogger();
  handleCrashlyticsErrors();

  for (final initList in initAdapterList) {
    await initList.initAdapter();
  }

  final isFirstRunKeyExist =
  await locator<SharedPreferencesService>().isFirstRunKeyExist();
  if (!isFirstRunKeyExist) {
    await locator<SecureStorageService>().deleteAll();

    await locator<SharedPreferencesService>().createFirstRunKey();
  }


  runApp(await builder());
}

void initFlutterLogger() {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
  });
}

void handleCrashlyticsErrors() {
  final FirebaseCrashlytics firebaseCrashlytics = FirebaseCrashlytics.instance;
  FlutterError.onError = (errorDetails) {
    firebaseCrashlytics.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    firebaseCrashlytics.recordError(error, stack, fatal: true);
    return true;
  };
}
