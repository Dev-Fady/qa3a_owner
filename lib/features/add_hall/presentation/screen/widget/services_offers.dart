import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/InputText.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/name_service.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/show_packages.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/show_services.dart';


class ServicesOffers extends StatefulWidget {
  const ServicesOffers({
    super.key,
    required this.services,
    required this.packages,
    required this.onServicesUpdated,
    required this.onPackagesUpdated,
  });

  final List<Map<String, String>> services;
  final List<Map<String, String>> packages;
  final Function(List<Map<String, String>>) onServicesUpdated;
  final Function(List<Map<String, String>>) onPackagesUpdated;

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
                        final updatedServices = List<Map<String, String>>.from(widget.services);
                        updatedServices.add({
                          "name": serviceNameController.text,
                          "desc": serviceDescController.text,
                        });
                        widget.onServicesUpdated(updatedServices);

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

          ShowServices(services: widget.services),

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
                        final updatedPackages = List<Map<String, String>>.from(widget.packages);
                        updatedPackages.add({
                          "name": packageNameController.text,
                          "price": packagePriceController.text,
                          "desc": packageDescController.text,
                        });
                        widget.onPackagesUpdated(updatedPackages);

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

          ShowPackages(packages: widget.packages),
        ],
      ),
    );
  }
}

