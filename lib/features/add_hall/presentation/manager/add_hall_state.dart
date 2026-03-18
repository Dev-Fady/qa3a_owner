
part of 'add_hall_cubit.dart';

@immutable
abstract class AddHallState {}

class AddHallInitial extends AddHallState {}

class AddHallStepUpdated extends AddHallState {
  final int step;
  AddHallStepUpdated(this.step);
}

class AddHallTypeUpdated extends AddHallState {
  final String type;
  AddHallTypeUpdated(this.type);
}

class AddHallCityUpdated extends AddHallState {
  final String city;
  AddHallCityUpdated(this.city);
}


class AddHallImagesUpdated extends AddHallState {
  final List<String> images;
  AddHallImagesUpdated(this.images);
}

class AddHallServicesUpdated extends AddHallState {
  final List<Map<String, String>> services;
  AddHallServicesUpdated(this.services);
}

class AddHallPackagesUpdated extends AddHallState {
  final List<Map<String, String>> packages;
  AddHallPackagesUpdated(this.packages);
}

class AddHallLoading extends AddHallState {}


class AddHallSuccess extends AddHallState {}

class AddHallFailure extends AddHallState {
  final String message;
  AddHallFailure(this.message);
}
