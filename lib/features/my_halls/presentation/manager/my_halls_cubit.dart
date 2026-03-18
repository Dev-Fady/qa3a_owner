
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qa3a_owner/core/service/cache/hive_cache_Helper.dart';
import 'package:qa3a_owner/features/add_hall/models/hall_model.dart';

abstract class MyHallsState {}

class MyHallsInitial extends MyHallsState {}
class MyHallsLoading extends MyHallsState {}
class MyHallsSuccess extends MyHallsState {
  final List<HallModel> halls;
  MyHallsSuccess(this.halls);
}
class MyHallsFailure extends MyHallsState {
  final String message;
  MyHallsFailure(this.message);
}

class MyHallsCubit extends Cubit<MyHallsState> {
  MyHallsCubit() : super(MyHallsInitial());

  void getHalls() {
    emit(MyHallsLoading());
    try {
      final List<dynamic> hallsJson = HiveCacheHelper.getData(key: 'halls') ?? [];
      final List<HallModel> halls = hallsJson
          .map((e) => HallModel.fromJson(jsonDecode(e as String)))
          .toList();
      emit(MyHallsSuccess(halls));
    } catch (e) {
      emit(MyHallsFailure(e.toString()));
    }
  }
}
