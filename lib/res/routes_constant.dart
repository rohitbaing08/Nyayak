import 'package:go_router/go_router.dart';
import 'package:nyayak/view/screens/auth/initial_auth_view.dart';
import 'package:nyayak/view/screens/auth/login_view.dart';
import 'package:nyayak/view/screens/auth/provider_form_view.dart';
import 'package:nyayak/view/screens/auth/register_view.dart';
import 'package:nyayak/view/screens/bottom_nav.dart';
import 'package:nyayak/view/screens/community/add_post_view.dart';
import 'package:nyayak/view/screens/community/community_details_view.dart';
import 'package:nyayak/view/screens/community/community_view.dart';
import 'package:nyayak/view/screens/lawyar_profile.dart';
import 'package:nyayak/view/screens/splash_view.dart';


GoRouter router = GoRouter(initialLocation: '/initial-auth', routes: [
  GoRoute(
    name: 'bottom-nav',
    path: '/',
    builder: (context, state) => const BottomNavBar(),
  ),
  GoRoute(
    name: 'home',
    path: '/home',
    builder: (context, state) => const BottomNavBar(),
  ),
  GoRoute(
    name: 'splash',
    path: '/splash',
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    name: 'lawyer-profile',
    path: '/lawyer-profile',
    builder: (context, state) => const LawyerProfile(),
  ),
  GoRoute(
    name: 'login',
    path: '/login',
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    name: 'register',
    path: '/register/:isClient',
    builder: (context, state) => RegisterView(
      isClient: state.pathParameters['isClient']!,
    ),
  ),
  GoRoute(
    name: 'lawyerform',
    path: '/lawyer-form',
    builder: (context, state) => const ProviderFormView(),
  ),
  GoRoute(
    name: 'initial-auth',
    path: '/initial-auth',
    builder: (context, state) => const InitialAuthView(),
  ),
  GoRoute(
    name: 'community-details',
    path: '/community-details',
    builder: (context, state) => const CommunityDetails(),
  ),
  GoRoute(
    name: 'community-posts',
    path: '/community-posts',
    builder: (context, state) => const CommunityPostView(),
  ),
  GoRoute(
    name: 'add-community-posts',
    path: '/add-community-posts',
    builder: (context, state) => const AddCommunityPost(),
  ),
]);
