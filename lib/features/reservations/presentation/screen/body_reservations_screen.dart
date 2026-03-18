
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/features/reservations/presentation/widget/reservation_list_card.dart';
import 'package:qa3a_owner/features/reservations/presentation/widget/reservations_header.dart';
import 'package:qa3a_owner/features/reservations/presentation/widget/reservations_stats_row.dart';
import 'package:qa3a_owner/features/reservations/presentation/widget/search_and_filter.dart';

class BodyReservationsScreen extends StatelessWidget {
  const BodyReservationsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ReservationsHeader(),
                SizedBox(height: 25.h),
                const ReservationsStatsRow(),
                SizedBox(height: 20.h),
                const SearchAndFilter(),
                SizedBox(height: 20.h),
                const ReservationListCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

