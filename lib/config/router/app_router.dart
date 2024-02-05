import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/calc',
  routes: [
    ///* Auth Routes
    GoRoute(
      path: '/calc',
      builder: (context, state) =>  CalculatorScreen(),
    ),
  ],
);
