

import 'package:dating_app/injection_container.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppBlocObserver extends TalkerBlocObserver {
  AppBlocObserver()
      : super(
    talker: locator<Talker>(),
    settings: const TalkerBlocLoggerSettings(
      printChanges: true,
      printEvents: true,
      printTransitions: false,
    ),
  );
}