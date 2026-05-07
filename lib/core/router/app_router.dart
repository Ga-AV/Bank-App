import 'package:bank_app/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:bank_app/features/login/presentation/views/login_view.dart';
import 'package:bank_app/features/login/presentation/views/welcome_view.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => WelcomeView()),
    GoRoute(path: '/login', builder: (context, state) => LoginView()),
    GoRoute(path: '/dashboard', builder: (context, state) => DashboardView()),
  ],
);
