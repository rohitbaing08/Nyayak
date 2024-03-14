import 'package:go_router/go_router.dart';
import 'package:nyayak/view/screens/splash_view.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
    name: 'home',
    path: '/',
    builder: (context, state) => const SplashView(),
  )
]);
