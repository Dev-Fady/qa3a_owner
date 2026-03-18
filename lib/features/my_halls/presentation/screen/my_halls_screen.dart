import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qa3a_owner/features/my_halls/presentation/manager/my_halls_cubit.dart';
import 'package:qa3a_owner/features/my_halls/presentation/screen/widget/hall_card.dart';
import 'package:qa3a_owner/features/my_halls/presentation/screen/widget/stats_row.dart';

class MyHallsScreen extends StatelessWidget {
  const MyHallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyHallsCubit()..getHalls(),
      child: Scaffold(
        backgroundColor: const Color(0xffF8FBFF),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "قاعاتي",
            style: TextStyle(
              color: Colors.blue.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<MyHallsCubit, MyHallsState>(
          builder: (context, state) {
            if (state is MyHallsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MyHallsSuccess) {
              if (state.halls.isEmpty) {
                return const Center(child: Text("لا توجد قاعات مضافة"));
              }
              return SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "إدارة جميع القاعات الخاصة بك",
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 20.h),
                    StatsRow(count: state.halls.length),
                    SizedBox(height: 20.h),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.halls.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16.h),
                      itemBuilder: (context, index) =>
                          HallCard(hall: state.halls[index]),
                    ),
                  ],
                ),
              );
            } else if (state is MyHallsFailure) {
              return Center(child: Text("خطأ: ${state.message}"));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
