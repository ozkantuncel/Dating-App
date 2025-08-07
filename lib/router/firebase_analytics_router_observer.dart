import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class FirebaseAnalyticsRouterObserver extends FirebaseAnalyticsObserver {
  FirebaseAnalyticsRouterObserver({required super.analytics});

  String? _currRouteName;
  String? _prevRouteName;

  String get prevRouteName => _prevRouteName ?? 'unknow';

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _prevRouteName = _currRouteName;
    _currRouteName = route.settings.name;
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _currRouteName = previousRoute?.settings.name;
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _prevRouteName = oldRoute?.settings.name;
    _currRouteName = newRoute?.settings.name;
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
