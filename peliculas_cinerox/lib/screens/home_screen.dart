import 'package:flutter/material.dart';
import 'package:peliculas_cinerox/providers/movies_provider.dart';
import 'package:peliculas_cinerox/search/search_delegate.dart';
import 'package:peliculas_cinerox/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('CineRox'),
          elevation: 0,
          actions: [
            IconButton(
                icon: Icon(Icons.search_outlined),
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Tarjetas Principales
              CardSwiper(movies: moviesProvider.onDisplayMovie),

              //Slider Peliculas
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares',
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }
}
