import 'package:go_router/go_router.dart';
import 'package:nyayak/view/screens/home_view.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
    name: 'home',
    path: '/',
    builder: (context, state) => const HomeView(),
  )
]);
