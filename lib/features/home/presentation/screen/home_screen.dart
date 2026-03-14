import 'package:flutter/material.dart';
import 'package:qa3a_owner/features/home/presentation/screen/widgets/body_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE4EFFF),
        body: BodyHomeScreen(),
      ),
    );
  }
}
