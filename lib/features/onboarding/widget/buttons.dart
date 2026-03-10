import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qa3a_owner/config/routes/router_name.dart';
import 'package:qa3a_owner/core/constant/constant.dart';
import 'package:qa3a_owner/core/data/dummy/dummy_data.dart';
import 'package:qa3a_owner/core/service/cache/shared_cache_helper.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.currentIndex,
    required PageController controller,
  }) : _controller = controller;

  final int currentIndex;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          /// next
          ElevatedButton(
            style: TextButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              if (currentIndex == onboardingData.length - 1) {
                // save Fist login in app cache
                SharedCacheHelper().saveData(key: kIsFirstLogin, value: true);
                log(
                  "Saved first login: ${SharedCacheHelper().getData(key: kIsFirstLogin)}",
                );
                GoRouter.of(
                  context,
                ).pushReplacementNamed(RouterName.signInScreen);
              } else {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn,
                );
              }
            },
            child: Text(
              currentIndex == onboardingData.length - 1 ? "البدء" : "التالي",
              style: TextStyle(fontSize: 12.sp, color: Colors.white),
            ),
          ),

          const Spacer(),

          /// skip
          if (currentIndex != onboardingData.length - 1)
            TextButton(
              onPressed: () {
                SharedCacheHelper().saveData(key: kIsFirstLogin, value: true);
                log(
                  "Saved first login: ${SharedCacheHelper().getData(key: kIsFirstLogin)}",
                );
                GoRouter.of(
                  context,
                ).pushReplacementNamed(RouterName.signInScreen);
              },
              child: Text("تخطي", style: TextStyle(fontSize: 12.sp)),
            ),
        ],
      ),
    );
  }
}
