import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/screens/home.screen.dart';
import 'package:grocery_app/screens/intro.screen.dart';

class AppRouter {
  AppRouter();
  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      // GoRoute(
      //   path: '/',
      //   name: 'intro',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const IntroScreen();
      //   },
      // ),
      GoRoute(
        path: '/',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
    ],
  );
}
