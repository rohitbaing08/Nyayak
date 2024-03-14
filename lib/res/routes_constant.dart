import 'package:blockchain_app/view/screens/home_view.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
    name: 'home',
    path: '/',
    builder: (context, state) => const HomeView(),
  )
]);
