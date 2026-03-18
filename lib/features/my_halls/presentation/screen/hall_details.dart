import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/features/add_hall/models/hall_model.dart';

class HallDetails extends StatelessWidget {
  const HallDetails({super.key, required this.hallModel});
  final HallModel hallModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hallModel.name ?? "تفاصيل القاعة"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImages(),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildHeader(),
                  SizedBox(height: 12.h),
                  _buildInfo(),
                  SizedBox(height: 12.h),
                  _buildDescription(),
                  SizedBox(height: 12.h),
                  _buildServices(),
                  SizedBox(height: 12.h),
                  _buildPackages(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔥 الصور
  Widget _buildImages() {
    final images = hallModel.images ?? [];

    if (images.isEmpty) {
      return Image.network(
        "https://via.placeholder.com/400x200",
        height: 220.h,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }

    return SizedBox(
      height: 220.h,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.file(
            File(images[index]),
            fit: BoxFit.cover,
            width: double.infinity,
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          hallModel.name ?? "",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6.h),
        Text(
          hallModel.type ?? "",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${hallModel.pricePerDay ?? 0} ج.م / اليوم",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              "${hallModel.pricePerHour ?? 0} ج.م / الساعة",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  // 🔥 معلومات أساسية
  Widget _buildInfo() {
    return Column(
      children: [
        _row(Icons.location_on, hallModel.city ?? "غير محدد"),
        _row(Icons.home, hallModel.address ?? "لا يوجد عنوان"),
        _row(Icons.people, "السعة: ${hallModel.capacity ?? 0} شخص"),
      ],
    );
  }

  // 🔥 الوصف
  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "الوصف",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6.h),
        Text(
          hallModel.description ?? "لا يوجد وصف",
          style: TextStyle(color: Colors.grey.shade700),
        ),
      ],
    );
  }

  // 🔥 الخدمات
  Widget _buildServices() {
    final services = hallModel.services ?? [];

    if (services.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "الخدمات",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6.h),
        ...services.map(
          (e) => _row(Icons.check_circle, e['name'] ?? ""),
        ),
      ],
    );
  }

  // 🔥 الباقات
  Widget _buildPackages() {
    final packages = hallModel.packages ?? [];

    if (packages.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "الباقات",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6.h),
        ...packages.map(
          (e) => Container(
            margin: EdgeInsets.only(bottom: 8.h),
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(e['name'] ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(e['price'] ?? ""),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 🔥 Row موحد
  Widget _row(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(text),
          SizedBox(width: 8.w),
          Icon(icon, color: Colors.blue),
        ],
      ),
    );
  }
}