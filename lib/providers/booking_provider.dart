import 'package:flutter/material.dart';
import '../models/booking.dart';
import '../models/car.dart';

class BookingProvider with ChangeNotifier {
  List<Booking> _bookings = [];
  Booking? _currentBooking;

  List<Booking> get bookings => _bookings;
  Booking? get currentBooking => _currentBooking;

  List<Booking> get activeBookings => _bookings.where((booking) => 
    booking.status == BookingStatus.active).toList();

  List<Booking> get completedBookings => _bookings.where((booking) => 
    booking.status == BookingStatus.completed).toList();

  List<Booking> get pendingBookings => _bookings.where((booking) => 
    booking.status == BookingStatus.pending).toList();

  BookingProvider() {
    _loadBookings();
  }

  void _loadBookings() {
    // Sample data - in real app, this would come from API
    _bookings = [
      Booking(
        id: '1',
        carId: '1',
        userId: 'user1',
        startDate: DateTime.now().add(const Duration(days: 1)),
        endDate: DateTime.now().add(const Duration(days: 3)),
        totalDays: 2,
        totalPrice: 500000,
        status: BookingStatus.confirmed,
        pickupLocation: 'Jakarta Selatan',
        returnLocation: 'Jakarta Selatan',
        notes: 'Mobil untuk perjalanan keluarga',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      Booking(
        id: '2',
        carId: '2',
        userId: 'user1',
        startDate: DateTime.now().subtract(const Duration(days: 5)),
        endDate: DateTime.now().subtract(const Duration(days: 3)),
        totalDays: 2,
        totalPrice: 600000,
        status: BookingStatus.completed,
        pickupLocation: 'Jakarta Pusat',
        returnLocation: 'Jakarta Pusat',
        notes: 'Perjalanan bisnis',
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
      ),
    ];
    notifyListeners();
  }

  Future<void> createBooking({
    required String carId,
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
    required String pickupLocation,
    required String returnLocation,
    required double totalPrice,
    String notes = '',
  }) async {
    final totalDays = endDate.difference(startDate).inDays + 1;
    
    final booking = Booking(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      carId: carId,
      userId: userId,
      startDate: startDate,
      endDate: endDate,
      totalDays: totalDays,
      totalPrice: totalPrice,
      status: BookingStatus.pending,
      pickupLocation: pickupLocation,
      returnLocation: returnLocation,
      notes: notes,
      createdAt: DateTime.now(),
    );

    _bookings.insert(0, booking);
    notifyListeners();
  }

  Future<void> updateBookingStatus(String bookingId, BookingStatus status) async {
    final index = _bookings.indexWhere((booking) => booking.id == bookingId);
    if (index != -1) {
      _bookings[index] = Booking(
        id: _bookings[index].id,
        carId: _bookings[index].carId,
        userId: _bookings[index].userId,
        startDate: _bookings[index].startDate,
        endDate: _bookings[index].endDate,
        totalDays: _bookings[index].totalDays,
        totalPrice: _bookings[index].totalPrice,
        status: status,
        pickupLocation: _bookings[index].pickupLocation,
        returnLocation: _bookings[index].returnLocation,
        notes: _bookings[index].notes,
        createdAt: _bookings[index].createdAt,
        car: _bookings[index].car,
      );
      notifyListeners();
    }
  }

  Future<void> cancelBooking(String bookingId) async {
    await updateBookingStatus(bookingId, BookingStatus.cancelled);
  }

  Booking? getBookingById(String id) {
    try {
      return _bookings.firstWhere((booking) => booking.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Booking> getBookingsByStatus(BookingStatus status) {
    return _bookings.where((booking) => booking.status == status).toList();
  }

  void setCurrentBooking(Booking? booking) {
    _currentBooking = booking;
    notifyListeners();
  }
}
