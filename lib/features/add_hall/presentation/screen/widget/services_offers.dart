import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/InputText.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/name_service.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/show_packages.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/show_services.dart';

class ServicesOffers extends StatefulWidget {
  const ServicesOffers({super.key});

  @override
  State<ServicesOffers> createState() => _ServicesOffersState();
}

class _ServicesOffersState extends State<ServicesOffers> {
  // 🔹 Form Keys
  final _serviceFormKey = GlobalKey<FormState>();
  final _packageFormKey = GlobalKey<FormState>();

  // 🔹 Controllers
  final serviceNameController = TextEditingController();
  final serviceDescController = TextEditingController();

  final packageNameController = TextEditingController();
  final packagePriceController = TextEditingController();
  final packageDescController = TextEditingController();

  // 🔹 Data Lists
  List<Map<String, String>> services = [];
  List<Map<String, String>> packages = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          /// ================== SERVICES ==================
          NameService(name: "الخدمات المتاحة"),
          SizedBox(height: 10.h),

          Form(
            key: _serviceFormKey,
            child: Column(
              children: [
                InputText(
                  label: "اسم الخدمة",
                  controller: serviceNameController,
                ),
                SizedBox(height: 8.h),
                InputText(
                  label: "وصف الخدمة",
                  controller: serviceDescController,
                ),
                SizedBox(height: 10.h),

                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_serviceFormKey.currentState!.validate()) {
                        setState(() {
                          services.add({
                            "name": serviceNameController.text,
                            "desc": serviceDescController.text,
                          });
                        });

                        serviceNameController.clear();
                        serviceDescController.clear();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("تمت إضافة الخدمة بنجاح"),
                          ),
                        );
                      }
                    },
                    icon: Icon(Icons.add, size: 16.sp),
                    label: Text(
                      "إضافة خدمة",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15.h),

          ShowServices(services: services),

          SizedBox(height: 20.h),

          NameService(name: "العروض والباقات"),
          SizedBox(height: 10.h),

          Form(
            key: _packageFormKey,
            child: Column(
              children: [
                InputText(
                  label: "اسم الباقة",
                  hintText: "الفضي / الذهبي / الماسي",
                  controller: packageNameController,
                ),
                SizedBox(height: 8.h),
                InputText(label: "السعر", controller: packagePriceController),
                SizedBox(height: 8.h),
                InputText(
                  label: "وصف الباقة",
                  controller: packageDescController,
                ),
                SizedBox(height: 10.h),

                /// زر إضافة باقة
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_packageFormKey.currentState!.validate()) {
                        setState(() {
                          packages.add({
                            "name": packageNameController.text,
                            "price": packagePriceController.text,
                            "desc": packageDescController.text,
                          });
                        });

                        packageNameController.clear();
                        packagePriceController.clear();
                        packageDescController.clear();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("تمت إضافة الباقة بنجاح"),
                          ),
                        );
                      }
                    },
                    icon: Icon(Icons.add, size: 16.sp),
                    label: Text(
                      "إضافة باقة",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15.h),

          ShowPackages(packages: packages),
        ],
      ),
    );
  }
}
