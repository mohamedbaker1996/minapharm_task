import 'dart:convert';

import 'package:flutter/cupertino.dart';

class MovieResult with ChangeNotifier {
  MovieResult({
    required this.originalTitle,
    required this.posterPath,
    required this.id,
  });

  String? originalTitle;
  String? posterPath;
  int? id;

  factory MovieResult.fromJson(Map<String, dynamic> json) => MovieResult(
        originalTitle: json["original_title"],
        posterPath: json["poster_path"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "originalTitle": originalTitle,
        "posterPath": posterPath,
        "id": id,
      };
}
