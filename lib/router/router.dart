import 'package:dating_app/core/error_page/customErrorPage.dart';
import 'package:dating_app/features/authentication/login/presentation/views/login_page.dart';
import 'package:dating_app/features/authentication/register/presentation/views/register_page.dart';
import 'package:dating_app/features/home/home_page.dart';
import 'package:dating_app/features/image_upload/presentation/image_upload_page.dart';
import 'package:dating_app/injection_container.dart';
import 'package:dating_app/router/firebase_analytics_router_observer.dart';
import 'package:dating_app/router/router_observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dating_app/core/authorization/auth_manager.dart';
import 'app_routes.dart';

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final isLoggedIn = await locator<AuthManager>().isTokenNull();
  final isLoginRoute = state.matchedLocation == AppRoutes.login;
  final isRegisterRoute = state.matchedLocation == AppRoutes.register;

  if (!isLoggedIn! && !isLoginRoute && !isRegisterRoute) {
    return AppRoutes.login;
  } else if (!isLoggedIn && isRegisterRoute) {
    return AppRoutes.register;
  } else if (isLoginRoute && isLoginRoute && isLoggedIn) {
    return AppRoutes.home;
  }
  return null;
}

class AppRouter {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsRouterObserver firebaseAnalyticsRouterObserver =
      FirebaseAnalyticsRouterObserver(analytics: analytics);

  GoRouter get router => _goRouter;

  final GoRouter _goRouter = GoRouter(
    redirect: _redirect,
    initialLocation: AppRoutes.login,
    navigatorKey: locator<AuthManager>().navigatorKey,
    debugLogDiagnostics: true,
    observers: [
      GoRouterObserver(),
      FirebaseAnalyticsRouterObserver(analytics: analytics),
    ],
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.register,
        name: AppRoutes.register,
        builder: (context, state) => RegisterPage(),
      ),

      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        builder: (context, state) => LoginPage(),
      ),

      GoRoute(
        path: AppRoutes.uploadPhoto,
        name: AppRoutes.uploadPhoto,
        builder: (context, state) => UploadPhotoPage(),
      ),

      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => HomePage(),
      ),
    ],
    errorBuilder: (context, state) => PageCouldNotBeReached(),
  );
}
