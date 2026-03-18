
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PhotoStep extends StatelessWidget {
  const PhotoStep({
    super.key,
    required this.selectedImages,
    required this.onAddImage,
    required this.onRemoveImage,
  });

  final List<String> selectedImages;
  final Function(String) onAddImage;
  final Function(int) onRemoveImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();
    if (images.isNotEmpty) {
      for (var image in images) {
        onAddImage(image.path);
      }
    }
  }

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
          /// Selected Images Preview
          if (selectedImages.isNotEmpty)
            SizedBox(
              height: 100.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: selectedImages.length,
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.file(
                          File(selectedImages[index]),
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () => onRemoveImage(index),
                          child: Container(
                            padding: EdgeInsets.all(4.w),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.close, size: 12.sp, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          
          if (selectedImages.isNotEmpty) SizedBox(height: 20.h),

          /// Drop Area
          GestureDetector(
            onTap: _pickImage,
            child: DottedBorder(
              options: RectDottedBorderOptions(
                dashPattern: const [6, 4],
                color: Colors.blue,
                strokeWidth: 1.5,
              ),
              child: Container(
                height: 150.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image_outlined, size: 40.sp, color: Colors.blue),
                    SizedBox(height: 10.h),
                    Text(
                      "اسحب الصور هنا أو اضغط للرفع",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "يمكنك رفع صور من المعرض\n(PNG, JPG, JPEG)",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


