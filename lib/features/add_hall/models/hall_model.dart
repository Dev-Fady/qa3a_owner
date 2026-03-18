
class HallModel {
  final String? name;
  final String? type;
  final String? description;
  final String? address;
  final String? city;
  final String? capacity;
  final String? pricePerHour;
  final String? pricePerDay;
  final List<String>? images;
  final List<Map<String, String>>? services;
  final List<Map<String, String>>? packages;

  HallModel({
    this.name,
    this.type,
    this.description,
    this.address,
    this.city,
    this.capacity,
    this.pricePerHour,
    this.pricePerDay,
    this.images,
    this.services,
    this.packages,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'description': description,
      'address': address,
      'city': city,
      'capacity': capacity,
      'pricePerHour': pricePerHour,
      'pricePerDay': pricePerDay,
      'images': images,
      'services': services,
      'packages': packages,
    };
  }

  factory HallModel.fromJson(Map<String, dynamic> json) {
    return HallModel(
      name: json['name'],
      type: json['type'],
      description: json['description'],
      address: json['address'],
      city: json['city'],
      capacity: json['capacity'],
      pricePerHour: json['pricePerHour'],
      pricePerDay: json['pricePerDay'],
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      services: json['services'] != null
          ? List<Map<String, String>>.from((json['services'] as List).map((e) => Map<String, String>.from(e)))
          : null,
      packages: json['packages'] != null
          ? List<Map<String, String>>.from((json['packages'] as List).map((e) => Map<String, String>.from(e)))
          : null,
    );
  }

  HallModel copyWith({
    String? name,
    String? type,
    String? description,
    String? address,
    String? city,
    String? capacity,
    String? pricePerHour,
    String? pricePerDay,
    List<String>? images,
    List<Map<String, String>>? services,
    List<Map<String, String>>? packages,
  }) {
    return HallModel(
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      address: address ?? this.address,
      city: city ?? this.city,
      capacity: capacity ?? this.capacity,
      pricePerHour: pricePerHour ?? this.pricePerHour,
      pricePerDay: pricePerDay ?? this.pricePerDay,
      images: images ?? this.images,
      services: services ?? this.services,
      packages: packages ?? this.packages,
    );
  }
}
