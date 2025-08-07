import 'package:dating_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

class GoRouterObserver extends TalkerRouteObserver {
  GoRouterObserver() : super(locator<Talker>());

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    talker.info('Pushed to: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    talker.info('Popped from: ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    talker.info('Removed: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    talker.info(
      'Replaced: ${oldRoute?.settings.name} with ${newRoute?.settings.name}',
    );
  }
}
