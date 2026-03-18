import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/features/reservations/presentation/widget/reservations_stat_card.dart';

class ReservationsStatsRow extends StatelessWidget {
  const ReservationsStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ReservationsStatCard(
            title: 'إجمالي الحجوزات',
            value: '3',
            color: const Color(0xFF1E6AD1),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: ReservationsStatCard(
            title: 'قيد الانتظار',
            value: '1',
            color: const Color(0xFFF1B44C),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: ReservationsStatCard(
            title: 'مؤكد',
            value: '1',
            color: const Color(0xFF34C38F),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: ReservationsStatCard(
            title: 'ملغية',
            value: '1',
            color: const Color(0xFFF46A6A),
          ),
        ),
      ],
    );
  }
}