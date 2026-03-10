import 'package:go_router/go_router.dart';
import 'package:qa3a_owner/config/routes/router_name.dart';
import 'package:qa3a_owner/features/auth/sign_on/screen/sign_on_screen.dart';
import 'package:qa3a_owner/features/auth/sign_up/screen/sign_up_screen.dart';
import 'package:qa3a_owner/features/onboarding/screen/onboarding_screen.dart';
import 'package:qa3a_owner/features/splash/screen/splash_screen.dart';
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
    ],
  );
}

GoRouter initializeRouter() {
  // final bool isLogin = SharedCacheHelper().getData(key: 'isLogin') ?? false;
  // return createRouter(isLogin ? RouterName.homeScreen : RouterName.splashScreen);
  return createRouter(RouterName.splashScreen);
}
