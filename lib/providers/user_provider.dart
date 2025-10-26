import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _currentUser != null;

  UserProvider() {
    _loadUser();
  }

  void _loadUser() {
    // Sample user data - in real app, this would come from API or local storage
    _currentUser = User(
      id: 'user1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phone: '+6281234567890',
      profileImage: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150',
      address: 'Jakarta Selatan, Indonesia',
      createdAt: DateTime.now().subtract(const Duration(days: 365)),
      totalBookings: 5,
      rating: 4.8,
    );
    notifyListeners();
  }

  Future<void> updateProfile({
    String? name,
    String? email,
    String? phone,
    String? address,
    String? profileImage,
  }) async {
    if (_currentUser == null) return;

    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    _currentUser = _currentUser!.copyWith(
      name: name,
      email: email,
      phone: phone,
      address: address,
      profileImage: profileImage,
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    _currentUser = null;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    _currentUser = User(
      id: 'user1',
      name: 'John Doe',
      email: email,
      phone: '+6281234567890',
      profileImage: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150',
      address: 'Jakarta Selatan, Indonesia',
      createdAt: DateTime.now().subtract(const Duration(days: 365)),
      totalBookings: 5,
      rating: 4.8,
    );

    _isLoading = false;
    notifyListeners();
  }
}
