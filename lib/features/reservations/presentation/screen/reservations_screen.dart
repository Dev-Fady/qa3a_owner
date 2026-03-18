import 'package:flutter/material.dart';
import 'package:qa3a_owner/core/theme/app_theme.dart';
import 'package:qa3a_owner/features/reservations/presentation/screen/body_reservations_screen.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BodyReservationsScreen(),
    );
  }
}
