
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qa3a_owner/features/add_hall/presentation/manager/add_hall_cubit.dart';
import 'package:qa3a_owner/features/add_hall/presentation/screen/widget/add_hall_body.dart';

class AddHallScreen extends StatelessWidget {
  const AddHallScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddHallCubit(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffE4EFFF),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              "إضافة قاعة جديدة",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
          body: const AddHallBody(),
        ),
      ),
    );
  }
}


