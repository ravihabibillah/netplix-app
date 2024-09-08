import 'package:go_router/go_router.dart';
import 'package:netplix_app/config/routes/app_paths.dart';
import 'package:netplix_app/config/routes/app_routes.dart';
import 'package:netplix_app/features/home/representation/ui/home_screen.dart';
import 'package:netplix_app/features/home/representation/ui/search_screen.dart';

class AppPages {
  static final router = GoRouter(
    initialLocation: AppPaths.home,
    routes: [
      GoRoute(
        name: AppRoutes.home,
        path: AppPaths.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: AppRoutes.search,
        path: AppPaths.search,
        builder: (context, state) => const SearchScreen(),
      ),
    ],
  );
}
