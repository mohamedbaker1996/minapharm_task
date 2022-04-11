import 'dart:convert' show json;
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:http/http.dart' as http;

import '../models/movie_res.dart';

class ApiService {
  static ApiService? _instance;

  ApiService._();

  static ApiService get getInstance => _instance = _instance ?? ApiService._();

  Future<List<MovieResult>?> getMovies() async {
    var movUrl =
        "https://api.themoviedb.org/3/movie/popular?api_key=abf9dbdd099c81dc57fca1bc53c6f569&language=en-US";
    try {
      var isCachExist =
          await APICacheManager().isAPICacheKeyExist("API_Movies");
      if (!isCachExist) {
        var result = await http.get(Uri.parse(movUrl));
        // print('URL:Hit');
        if (result.statusCode == 200) {
          APICacheDBModel cacheDBModel = APICacheDBModel(
            key: "API_Movies",
            syncData: result.body,
          );
          await APICacheManager().addCacheData(cacheDBModel);
          var resMap = json.decode(result.body)['results'] as List;
          final modelList =
              resMap.map<MovieResult>((e) => MovieResult.fromJson(e)).toList();
          return modelList;
        }
        return null;
      } else {
        // print("getCache: hit");
        var cacheData = await APICacheManager().getCacheData("API_Movies");
        var resMap = json.decode(cacheData.syncData)['results'] as List;
        final modelList =
            resMap.map<MovieResult>((e) => MovieResult.fromJson(e)).toList();
        return modelList;
      }
    } catch (error) {
      throw (error);
    }
  }
}
