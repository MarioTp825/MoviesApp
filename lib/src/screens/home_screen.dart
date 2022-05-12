import 'package:flutter/material.dart';
import 'package:movies_app/src/provider/movies_provider.dart';
import 'package:movies_app/src/search/search_delegate.dart';
import 'package:movies_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  var loading = false;
  MoviesProvider? moviesProvider;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Movies Online'),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 5.0,
              ),
              CardSwiper(
                items: moviesProvider!.playingNow,
              ),
              //Slider Movies
              MovieSlider(
                title: "Popular",
                  movies: moviesProvider!.popular,
                  onNextPage: popularNextPage
              ),
              // const MovieSlider(),
              // const MovieSlider()
            ],
          ),
        )
    );
  }


  popularNextPage() async {
    if(!loading) {
      loading = true;
      await moviesProvider!.getPopularMovies();
      loading = false;
    }
  }
}
