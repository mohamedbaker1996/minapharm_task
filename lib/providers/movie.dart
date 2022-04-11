// import 'dart:convert' show json;

// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;

// import '../models/movie_res.dart';

// class MovieItem with ChangeNotifier {
//   final int id;
//   final String originalTitle;
//   final String posterPath;

//   MovieItem({
//     required this.id,
//     required this.originalTitle,
//     required this.posterPath,
//   });
// }

// class Movie with ChangeNotifier {
//   List<MovieItem> _movies = [];
//   Movie(this._movies);
//   List<MovieItem> get Movies {
//     return [..._movies];
//   }
//   // var headers = {
//   //   'Content-Type': "application/json",
//   //   'X-RapidAPI-Host': 'mdblist.p.rapidapi.com',
//   //   'X-RapidAPI-Key': 'e5a4120feamshb60764d9ed0d8dap17a12ajsnfde9c9c1f1ac'
//   // };

//   // var movUrl = "https://mdblist.p.rapidapi.com/?i=tt0073195";
//   var movUrl =
//       "https://api.themoviedb.org/3/movie/popular?api_key=abf9dbdd099c81dc57fca1bc53c6f569&language=en-US";

//   Future<List<MovieResult>?> fetchAndSetMovies() async {
//     var response = await http.get(Uri.parse(movUrl));

//     if (response.statusCode == 200) {
//       List<MovieItem> loadedMovies = [];
//       final extractedData = json.decode(response.body)['results'] as List;
//       if (extractedData == null) {
//         return null;
//       }
//       final modelList = extractedData
//           .map<MovieResult>((e) => MovieResult.fromJson(e))
//           .toList();
//       return modelList;
//       // extractedData.forEach((movieId, movieData) {
//       //   loadedMovies.add(
//       //     MovieItem(
//       //         id: int.parse(movieId),
//       //         originalTitle: movieData['originalTitle'],
//       //         posterPath: movieData['posterPath']),
//       //   );
//       // }
//       // );
//       // notifyListeners();
//       // print(json.decode(response.body));
//     }
//     return null;
//   }
// }
