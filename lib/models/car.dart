class Car {
  final String id;
  final String name;
  final String brand;
  final String model;
  final String year;
  final String imageUrl;
  final double pricePerDay;
  final double rating;
  final int reviewCount;
  final String fuelType;
  final String transmission;
  final int seats;
  final String description;
  final List<String> features;
  final bool isAvailable;
  final String location;

  Car({
    required this.id,
    required this.name,
    required this.brand,
    required this.model,
    required this.year,
    required this.imageUrl,
    required this.pricePerDay,
    required this.rating,
    required this.reviewCount,
    required this.fuelType,
    required this.transmission,
    required this.seats,
    required this.description,
    required this.features,
    required this.isAvailable,
    required this.location,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      model: json['model'],
      year: json['year'],
      imageUrl: json['imageUrl'],
      pricePerDay: json['pricePerDay'].toDouble(),
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      fuelType: json['fuelType'],
      transmission: json['transmission'],
      seats: json['seats'],
      description: json['description'],
      features: List<String>.from(json['features']),
      isAvailable: json['isAvailable'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'model': model,
      'year': year,
      'imageUrl': imageUrl,
      'pricePerDay': pricePerDay,
      'rating': rating,
      'reviewCount': reviewCount,
      'fuelType': fuelType,
      'transmission': transmission,
      'seats': seats,
      'description': description,
      'features': features,
      'isAvailable': isAvailable,
      'location': location,
    };
  }
}
