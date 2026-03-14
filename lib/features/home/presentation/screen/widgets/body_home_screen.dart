import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/features/home/model/booking_model.dart';
import 'package:qa3a_owner/features/home/presentation/screen/widgets/action_button.dart';
import 'package:qa3a_owner/features/home/presentation/screen/widgets/recent_booking_card.dart';
import 'package:qa3a_owner/features/home/presentation/screen/widgets/stats_card.dart';



class BodyHomeScreen extends StatefulWidget {
  const BodyHomeScreen({super.key});

  @override
  State<BodyHomeScreen> createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  int selectedIndex = 0;

  final List<String> buttons = [
    "إضافة قاعة جديدة",
    "عرض جميع القاعات",
    "إدارة الحجوزات",
  ];

  final List<BookingModel> recentBookings = const [
    BookingModel(
      hallName: "قاعة الفرح الكبرى",
      clientName: "أحمد محمد أحمد",
      company: "",
      date: "2025-12-10",
      time: "17:00",
      price: 5000,
      status: BookingStatus.confirmed,
    ),
    BookingModel(
      hallName: "قاعة المؤتمرات",
      clientName: "شركة النجاح",
      company: "شركة النجاح",
      date: "2025-12-15",
      time: "16:00",
      price: 3500,
      status: BookingStatus.pending,
    ),
    BookingModel(
      hallName: "قاعة الفرح الكبرى",
      clientName: "محمد أحمد محمد",
      company: "",
      date: "2026-1-11",
      time: "16:00",
      price: 5000,
      status: BookingStatus.confirmed,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Header
            Text(
              "مرحبا بك , احمد",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              "نظرة سريعة على أداء قاعاتك اليوم",
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 16.sp, color: const Color(0xff003480)),
            ),
            SizedBox(height: 20.h),

            // Action Buttons
            SizedBox(
              height: 40.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: buttons.length,
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                itemBuilder: (context, index) {
                  return ActionButton(
                    text: buttons[index],
                    isPrimary: selectedIndex == index,
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),

            // Stats Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 12.w,
              childAspectRatio: 1.0,
              children: const [
                StatsCard(
                  icon: Icons.calendar_month,
                  iconColor: Colors.purple,
                  title: "الحجوزات النشطة",
                  value: "28",
                  subTitle: "+8 هذا الاسبوع",
                ),
                StatsCard(
                  icon: Icons.meeting_room,
                  iconColor: Colors.blue,
                  title: "إجمالي القاعات",
                  value: "12",
                  subTitle: "+2 هذا الشهر",
                ),
                StatsCard(
                  icon: Icons.groups,
                  iconColor: Colors.green,
                  title: "العملاء النشطين",
                  value: "156",
                  subTitle: "+24 عميل جديد",
                ),
                StatsCard(
                  icon: Icons.payments,
                  iconColor: Colors.orange,
                  title: "الإيرادات الشهرية",
                  value: "35,000 ج.م",
                  subTitle: "+8% عن الشهر السابق",
                ),
              ],
            ),

            SizedBox(height: 28.h),

            // ========== Recent Bookings Section ==========
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "عرض الكل",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xFF003480),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "الحجوزات الأخيرة",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      "آخر الحجوزات على قاعاتك",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 12.h),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recentBookings.length,
              separatorBuilder: (_, __) => SizedBox(height: 10.h),
              itemBuilder: (context, index) {
                return RecentBookingCard(booking: recentBookings[index]);
              },
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
