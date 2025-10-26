class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? profileImage;
  final String? address;
  final DateTime createdAt;
  final int totalBookings;
  final double rating;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.profileImage,
    this.address,
    required this.createdAt,
    this.totalBookings = 0,
    this.rating = 0.0,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      profileImage: json['profileImage'],
      address: json['address'],
      createdAt: DateTime.parse(json['createdAt']),
      totalBookings: json['totalBookings'] ?? 0,
      rating: json['rating']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profileImage': profileImage,
      'address': address,
      'createdAt': createdAt.toIso8601String(),
      'totalBookings': totalBookings,
      'rating': rating,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? profileImage,
    String? address,
    DateTime? createdAt,
    int? totalBookings,
    double? rating,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      totalBookings: totalBookings ?? this.totalBookings,
      rating: rating ?? this.rating,
    );
  }
}
