import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qa3a_owner/config/routes/router_name.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(RouterName.addHallScreen);
        },
        elevation: 4,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0.h,
        child: SizedBox(
          height: 65.h,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  context.goNamed(RouterName.settingsScreen);
                },
                icon: Icon(Icons.settings),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.business)),
              SizedBox(width: 50.w), // The dummy child
              IconButton(onPressed: () {}, icon: Icon(Icons.calendar_today)),
              IconButton(
                onPressed: () {
                  context.goNamed(RouterName.homeScreen);
                },
                icon: Icon(Icons.home),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
