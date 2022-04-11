import 'package:flutter/material.dart';
import 'package:minapharm_task/network/api_state.dart';
import '../widgets/movie_item.dart';
import 'package:provider/provider.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context, listen: false);
    final movies = state.movies;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: movies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: movies[index],
        child: MovieItem(),
      ),
    );
  }
}
