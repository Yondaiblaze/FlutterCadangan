import 'package:flutter/material.dart';
import '../models/car.dart';

class CarProvider with ChangeNotifier {
  List<Car> _cars = [];
  List<Car> _filteredCars = [];
  String _searchQuery = '';
  String _selectedBrand = 'All';
  double _minPrice = 0;
  double _maxPrice = 1000000;

  List<Car> get cars => _filteredCars;
  String get searchQuery => _searchQuery;
  String get selectedBrand => _selectedBrand;
  double get minPrice => _minPrice;
  double get maxPrice => _maxPrice;

  List<String> get brands => ['All', 'Toyota', 'Honda', 'Suzuki', 'Daihatsu', 'Mitsubishi', 'Nissan'];

  CarProvider() {
    _loadCars();
  }

  void _loadCars() {
    _cars = [
      Car(
        id: '1',
        name: 'Toyota Avanza',
        brand: 'Toyota',
        model: 'Avanza',
        year: '2023',
        imageUrl: 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=500',
        pricePerDay: 250000,
        rating: 4.5,
        reviewCount: 128,
        fuelType: 'Bensin',
        transmission: 'Manual',
        seats: 7,
        description: 'Mobil keluarga yang nyaman dan irit bahan bakar',
        features: ['AC', 'Power Steering', 'Audio System', 'Safety Airbag'],
        isAvailable: true,
        location: 'Jakarta Selatan',
      ),
      Car(
        id: '2',
        name: 'Honda Jazz',
        brand: 'Honda',
        model: 'Jazz',
        year: '2023',
        imageUrl: 'https://images.unsplash.com/photo-1549317336-206569e8475c?w=500',
        pricePerDay: 300000,
        rating: 4.7,
        reviewCount: 95,
        fuelType: 'Bensin',
        transmission: 'CVT',
        seats: 5,
        description: 'Hatchback sporty dengan performa tangguh',
        features: ['AC', 'Power Steering', 'Audio System', 'Bluetooth', 'Reverse Camera'],
        isAvailable: true,
        location: 'Jakarta Pusat',
      ),
      Car(
        id: '3',
        name: 'Suzuki Ertiga',
        brand: 'Suzuki',
        model: 'Ertiga',
        year: '2022',
        imageUrl: 'https://images.unsplash.com/photo-1544636331-e26879cd4d9b?w=500',
        pricePerDay: 200000,
        rating: 4.3,
        reviewCount: 87,
        fuelType: 'Bensin',
        transmission: 'Manual',
        seats: 7,
        description: 'MPV praktis dengan kabin luas',
        features: ['AC', 'Power Steering', 'Audio System', 'USB Port'],
        isAvailable: true,
        location: 'Jakarta Utara',
      ),
      Car(
        id: '4',
        name: 'Toyota Innova',
        brand: 'Toyota',
        model: 'Innova',
        year: '2023',
        imageUrl: 'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=500',
        pricePerDay: 400000,
        rating: 4.8,
        reviewCount: 156,
        fuelType: 'Diesel',
        transmission: 'Manual',
        seats: 7,
        description: 'MPV premium dengan performa diesel yang handal',
        features: ['AC', 'Power Steering', 'Audio System', 'Bluetooth', 'Reverse Camera', 'Cruise Control'],
        isAvailable: true,
        location: 'Jakarta Barat',
      ),
      Car(
        id: '5',
        name: 'Honda CR-V',
        brand: 'Honda',
        model: 'CR-V',
        year: '2023',
        imageUrl: 'https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?w=500',
        pricePerDay: 500000,
        rating: 4.9,
        reviewCount: 203,
        fuelType: 'Bensin',
        transmission: 'CVT',
        seats: 5,
        description: 'SUV premium dengan teknologi canggih',
        features: ['AC', 'Power Steering', 'Audio System', 'Bluetooth', 'Reverse Camera', 'Cruise Control', 'Sunroof'],
        isAvailable: true,
        location: 'Jakarta Selatan',
      ),
      Car(
        id: '6',
        name: 'Daihatsu Terios',
        brand: 'Daihatsu',
        model: 'Terios',
        year: '2022',
        imageUrl: 'https://images.unsplash.com/photo-1563720223185-11003d516935?w=500',
        pricePerDay: 350000,
        rating: 4.4,
        reviewCount: 74,
        fuelType: 'Bensin',
        transmission: 'Manual',
        seats: 7,
        description: 'SUV kompak yang tangguh di segala medan',
        features: ['AC', 'Power Steering', 'Audio System', '4WD'],
        isAvailable: false,
        location: 'Jakarta Timur',
      ),
    ];
    _filteredCars = _cars;
    notifyListeners();
  }

  void searchCars(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void filterByBrand(String brand) {
    _selectedBrand = brand;
    _applyFilters();
  }

  void filterByPriceRange(double min, double max) {
    _minPrice = min;
    _maxPrice = max;
    _applyFilters();
  }

  void _applyFilters() {
    _filteredCars = _cars.where((car) {
      bool matchesSearch = car.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          car.brand.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          car.model.toLowerCase().contains(_searchQuery.toLowerCase());
      
      bool matchesBrand = _selectedBrand == 'All' || car.brand == _selectedBrand;
      
      bool matchesPrice = car.pricePerDay >= _minPrice && car.pricePerDay <= _maxPrice;
      
      return matchesSearch && matchesBrand && matchesPrice && car.isAvailable;
    }).toList();
    
    notifyListeners();
  }

  Car? getCarById(String id) {
    try {
      return _cars.firstWhere((car) => car.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Car> getPopularCars() {
    return _cars.where((car) => car.rating >= 4.5).take(4).toList();
  }

  List<Car> getRecommendedCars() {
    return _cars.where((car) => car.isAvailable).take(6).toList();
  }
}
