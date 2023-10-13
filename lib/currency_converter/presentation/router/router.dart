import 'package:currency_converter/currency_converter/presentation/router/routers.dart';
import 'package:currency_converter/currency_converter/presentation/ui/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: AppRouters.homePage,
        builder: (BuildContext ctx, GoRouterState state) {
          return const HomeView();
        }),
  ]);
}
