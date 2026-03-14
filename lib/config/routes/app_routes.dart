import 'package:go_router/go_router.dart';
import 'package:qa3a_owner/config/routes/router_name.dart';
import 'package:qa3a_owner/core/constant/constant.dart';
import 'package:qa3a_owner/features/auth/screen/auth_screen.dart';
import 'package:qa3a_owner/features/auth/sign_on/presentation/screen/sign_on_screen.dart';
import 'package:qa3a_owner/features/auth/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:qa3a_owner/features/home/presentation/screen/home_screen.dart';
import 'package:qa3a_owner/features/nav_bar/screen/main_screen.dart';
import 'package:qa3a_owner/features/onboarding/screen/onboarding_screen.dart';
import 'package:qa3a_owner/features/settings/presentation/screen/settings_screen.dart';
import 'package:qa3a_owner/features/splash/screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:qa3a_owner/core/service/cache/shared_cache_helper.dart';

GoRouter createRouter(String initialLocation) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: RouterName.splashScreen,
        name: RouterName.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouterName.onBoardingScreen,
        name: RouterName.onBoardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RouterName.signInScreen,
        name: RouterName.signInScreen,
        builder: (context, state) => const SignOnScreen(),
      ),
      GoRoute(
        path: RouterName.signUpScreen,
        name: RouterName.signUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: RouterName.authScreen,
        name: RouterName.authScreen,
        builder: (context, state) => const AuthScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(child: child);
        },
        routes: [
          GoRoute(
            path: RouterName.homeScreen,
            name: RouterName.homeScreen,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: RouterName.settingsScreen,
            name: RouterName.settingsScreen,
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
}

Future<GoRouter> initializeRouter() async {
  final initialLocation = await getInitialRoute();
  return createRouter(initialLocation);
}

Future<String> getInitialRoute() async {
  final prefs = await SharedPreferences.getInstance();

  bool isFirstLogin = prefs.getBool(kIsFirstLogin) ?? true;
  bool isLogin = prefs.getBool(kIsLogin) ?? false;

  if (isFirstLogin) {
    await prefs.setBool(kIsFirstLogin, false);
    return RouterName.onBoardingScreen;
  } else if (isLogin) {
    return RouterName.homeScreen;
  } else {
    return RouterName.signInScreen;
  }
}
