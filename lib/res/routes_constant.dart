import 'package:go_router/go_router.dart';
import 'package:nyayak/view/screens/auth/initial_auth_view.dart';
import 'package:nyayak/view/screens/auth/login_view.dart';
import 'package:nyayak/view/screens/auth/register_view.dart';
import 'package:nyayak/view/screens/bottom_nav.dart';
import 'package:nyayak/view/screens/lawyar_profile.dart';
import 'package:nyayak/view/screens/splash_view.dart';
// import 'package:nyayak/view/screens/lawyar_profile.dart';


GoRouter router = GoRouter(routes: [
  GoRoute(
    name: 'bottom-nav',
    path: '/',
    builder: (context, state) => const BottomNavBar(),
  ),
  GoRoute(
    name: 'splash',
    path: '/splash',
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    name: 'login',
    path: '/login',
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    name: 'register',
    path: '/register',
    builder: (context, state) => const RegisterView(),
  ),
  GoRoute(
    name: 'lawyerProfile',
    path: '/lawyerProfile',
    builder: (context, state) => const LawyerProfile(),
  ),
  GoRoute(
    name: 'initial-auth',
    path: '/initial-auth',
    builder: (context, state) => const InitialAuthView(),
  )
]);
