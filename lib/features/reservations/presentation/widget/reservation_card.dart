import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/core/theme/app_theme.dart';

class ReservationCard extends StatelessWidget {
  final String hallName;
  final String customerName;
  final String phone;
  final String date;
  final String time;
  final String price;
  final String status;
  final String category;
  final Color statusColor;

  const ReservationCard({
    super.key,
    required this.hallName,
    required this.customerName,
    required this.phone,
    required this.date,
    required this.time,
    required this.price,
    required this.status,
    required this.category,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.blue.withAlpha(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: const Color(0xFF0A2351)),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: const Color(0xFF0A2351),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Text(
            hallName,
            style: AppTextStyles.heading2.copyWith(
              color: const Color(0xFF0A2351),
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 15.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    _buildInfoRow(Icons.person_outline, customerName),
                    SizedBox(height: 8.h),
                    _buildInfoRow(Icons.phone_outlined, phone),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    _buildInfoRow(Icons.calendar_today_outlined, date),
                    SizedBox(height: 8.h),
                    _buildInfoRow(Icons.access_time, time),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              price,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0A2351),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: const Color(0xFF1E6AD1)),
        SizedBox(width: 8.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xFF0A2351),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
