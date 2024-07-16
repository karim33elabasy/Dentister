import 'package:dentister/features/splash_onboard/presentation/views/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter{
  static String kSplashScreen = "/";
  static GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: kSplashScreen,
          builder: (context,state)=>const SplashScreen()
        ),
      ]
  );
}
