import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/screens/intro.screen.dart';

class AppRouter {
  AppRouter();
  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        name: '/intro',
        builder: (BuildContext context, GoRouterState state) {
          return const IntroScreen();
        },
      ),
    ],
  );
}
