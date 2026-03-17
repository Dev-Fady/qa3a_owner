import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceHolder extends StatelessWidget {
  const PlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey(-1),
      padding: EdgeInsets.all(20.w),
      child: const Text("سيتم إضافة هذا الجزء قريباً"),
    );
  }
}