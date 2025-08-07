import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dating_app/core/init_adapter/init_adapter.dart';
import 'package:dating_app/injection_container.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'app_bloc_observer.dart';

class AppBlocObserverInit implements InitAdapter {
  @override
  FutureOr<void> initAdapter() {
    Bloc.observer = AppBlocObserver();

    locator<Talker>().info(
      'TalkerService and AppBlocObserver initialized successfully.',
    );
  }
}
