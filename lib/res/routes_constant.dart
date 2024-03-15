import 'package:go_router/go_router.dart';
import 'package:nyayak/view/screens/splash_view.dart';
import 'package:nyayak/view/screens/home_view.dart';
import 'package:nyayak/view/screens/chat_view.dart';
import 'package:nyayak/view/screens/auth/login_view.dart';
import 'package:nyayak/view/screens/auth/register_view.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
    name: 'home',
    path: '/',
    builder: (context, state) => const RegisterView(),
  )
]);
