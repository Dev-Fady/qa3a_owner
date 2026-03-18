import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qa3a_owner/config/routes/router_name.dart';
import 'package:qa3a_owner/features/add_hall/models/hall_model.dart';

class HallCard extends StatelessWidget {
  const HallCard({super.key, required this.hall});
  final HallModel hall;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                child: hall.images != null && hall.images!.isNotEmpty
                    ? Image.file(
                        File(hall.images![0]),
                        height: 180.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        "https://via.placeholder.com/400x200",
                        height: 180.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "موافق عليها",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    hall.type ?? "غير محدد",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  hall.name ?? "اسم القاعة",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                _buildInfoRow(
                  Icons.location_on_outlined,
                  hall.city ?? "الموقع",
                ),
                _buildInfoRow(
                  Icons.people_outline,
                  "سعة ${hall.capacity ?? 0} شخص",
                ),
                _buildInfoRow(
                  Icons.calendar_today_outlined,
                  "تم الإضافة: 2025-03-17",
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.pushNamed(
                          RouterName.hallDetailsScreen,
                          extra: hall,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: const Text(
                        "عرض التفاصيل",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "السعر لليوم",
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                        Text(
                          "${hall.pricePerDay ?? 0} ج.م",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade700),
          ),
          SizedBox(width: 8.w),
          Icon(icon, size: 16.sp, color: Colors.blue),
        ],
      ),
    );
  }
}
