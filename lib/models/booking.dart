import 'car.dart';

enum BookingStatus {
  pending,
  confirmed,
  active,
  completed,
  cancelled,
}

class Booking {
  final String id;
  final String carId;
  final String userId;
  final DateTime startDate;
  final DateTime endDate;
  final int totalDays;
  final double totalPrice;
  final BookingStatus status;
  final String pickupLocation;
  final String returnLocation;
  final String notes;
  final DateTime createdAt;
  final Car? car;

  Booking({
    required this.id,
    required this.carId,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.totalDays,
    required this.totalPrice,
    required this.status,
    required this.pickupLocation,
    required this.returnLocation,
    required this.notes,
    required this.createdAt,
    this.car,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      carId: json['carId'],
      userId: json['userId'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      totalDays: json['totalDays'],
      totalPrice: json['totalPrice'].toDouble(),
      status: BookingStatus.values.firstWhere(
        (e) => e.toString() == 'BookingStatus.${json['status']}',
      ),
      pickupLocation: json['pickupLocation'],
      returnLocation: json['returnLocation'],
      notes: json['notes'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'carId': carId,
      'userId': userId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'totalDays': totalDays,
      'totalPrice': totalPrice,
      'status': status.toString().split('.').last,
      'pickupLocation': pickupLocation,
      'returnLocation': returnLocation,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  String get statusText {
    switch (status) {
      case BookingStatus.pending:
        return 'Menunggu Konfirmasi';
      case BookingStatus.confirmed:
        return 'Dikonfirmasi';
      case BookingStatus.active:
        return 'Sedang Berlangsung';
      case BookingStatus.completed:
        return 'Selesai';
      case BookingStatus.cancelled:
        return 'Dibatalkan';
    }
  }
}
