
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qa3a_owner/core/service/cache/hive_cache_Helper.dart';
import 'package:qa3a_owner/features/add_hall/models/hall_model.dart';

part 'add_hall_state.dart';

class AddHallCubit extends Cubit<AddHallState> {
  AddHallCubit() : super(AddHallInitial());

  // Step 1 Controllers
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  String? selectedType;

  // Step 2 Controllers
  final addressController = TextEditingController();
  String selectedCity = "القاهرة";
  final capacityController = TextEditingController();
  final pricePerHourController = TextEditingController();
  final pricePerDayController = TextEditingController();

  // Step 3
  List<String> selectedImages = [];

  // Step 4
  List<Map<String, String>> services = [];
  List<Map<String, String>> packages = [];

  int currentStep = 0;

  void updateStep(int step) {
    currentStep = step;
    emit(AddHallStepUpdated(step));
  }

  void updateType(String type) {
    selectedType = type;
    emit(AddHallTypeUpdated(type));
  }

  void updateCity(String city) {
    selectedCity = city;
    emit(AddHallCityUpdated(city));
  }

  void addImage(String path) {
    selectedImages.add(path);
    emit(AddHallImagesUpdated(List.from(selectedImages)));
  }

  void removeImage(int index) {
    selectedImages.removeAt(index);
    emit(AddHallImagesUpdated(List.from(selectedImages)));
  }


  void updateServices(List<Map<String, String>> servicesList) {
    services = servicesList;
    emit(AddHallServicesUpdated(List.from(services)));
  }

  void updatePackages(List<Map<String, String>> packagesList) {
    packages = packagesList;
    emit(AddHallPackagesUpdated(List.from(packages)));
  }

  Future<void> saveHall() async {

    emit(AddHallLoading());
    try {
      final hall = HallModel(
        name: nameController.text,
        type: selectedType,
        description: descriptionController.text,
        address: addressController.text,
        city: selectedCity,
        capacity: capacityController.text,
        pricePerHour: pricePerHourController.text,
        pricePerDay: pricePerDayController.text,
        images: selectedImages,
        services: services,
        packages: packages,
      );

      // Get existing halls
      List<dynamic> hallsJson = HiveCacheHelper.getData(key: 'halls') ?? [];
      List<String> hallsList = List<String>.from(hallsJson);
      
      // Add new hall as JSON string
      hallsList.add(jsonEncode(hall.toJson()));
      
      // Save back to Hive
      await HiveCacheHelper.saveData(key: 'halls', value: hallsList);
      
      emit(AddHallSuccess());
    } catch (e) {
      emit(AddHallFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    descriptionController.dispose();
    addressController.dispose();
    capacityController.dispose();
    pricePerHourController.dispose();
    pricePerDayController.dispose();
    return super.close();
  }
}
