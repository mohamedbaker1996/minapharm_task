import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:api_cache_manager/api_cache_manager.dart';

import '../models/movie_res.dart';
import 'api_service.dart';

class AppState extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<MovieResult> _movies = [];
  List<MovieResult> get movies => _movies;

  Future<void> fetchMovies() async {
    _isLoading = true;
    _movies = (await ApiService.getInstance.getMovies())!;
    _isLoading = false;
    notifyListeners();
  }
}
