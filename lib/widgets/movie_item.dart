import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:minapharm_task/models/movie_res.dart';
import 'package:provider/provider.dart';

class MovieItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MovieResult>(context);

    var imagepath = 'http://image.tmdb.org/t/p/w200/${state.posterPath!}';
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            state.originalTitle!,
            textAlign: TextAlign.center,
          ),
        ),
        //   child: FadeInImage(
        //     placeholder:
        //         const AssetImage('lib/assets/images/product-placeholder.png'),
        //     image: CachedNetworkImage( imageUrl: ''),
        //     // image:state.posterPath !=null ? NetworkImage(state.posterPath!):null,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: CachedNetworkImage(
          imageUrl: imagepath,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
