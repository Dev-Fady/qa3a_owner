import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qa3a_owner/config/routes/app_routes.dart';
import 'package:qa3a_owner/core/service/cache/hive_cache_Helper.dart';
import 'package:qa3a_owner/core/service/cache/shared_cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedCacheHelper().init();
  await HiveCacheHelper.init();
  final GoRouter router = initializeRouter();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return MyApp(router: router);
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            title: 'Qa3a Owner',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              fontFamily: 'Cairo',
            ),
            builder: DevicePreview.appBuilder,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
