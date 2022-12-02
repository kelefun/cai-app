import 'package:caichacha/ui/app_start_screen.dart';
import 'package:caichacha/ui/food/detail/detail_screen.dart';
import 'package:caichacha/ui/food/list/list_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:caichacha/enums/food_category_enum.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AppStartScreen(),
    ),
    GoRoute(
      path: '/food_list/:foodCategory',
      builder: (context, state) {
        final int idx = int.parse(state.params['foodCategory']!);
        return ListScreen(idx: idx);
      },
    ),
    GoRoute(
      path: '/food_detail',
      builder: (context, state) => const DetailScreen(),
    ),
  ],
);
