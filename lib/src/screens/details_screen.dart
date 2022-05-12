import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:movies_app/src/models/credits_response.dart';
import 'package:movies_app/src/models/now_playing_response.dart';
import 'package:movies_app/src/widgets/casting_cards.dart';
import 'package:provider/provider.dart';

import '../provider/movies_provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final movie = ModalRoute.of(context)!.settings.arguments as Results;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(movie: movie, size: size),
        SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie: movie, size: size),
              _OverView(overview: movie.overview),
              if (movie.id == null) blank() else getCast(movie.id!)
            ])),

      ],
    ));
  }

  getCast(int id) {
    return CastingCards(id: id);
  }

  blank() {
    return const SizedBox(width: 100, height: 100);
  }
}

class _CustomAppBar extends StatelessWidget {
  final Results movie;
  final Size size;

  const _CustomAppBar({Key? key, required this.movie, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0.0),
        title: Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black26,
          child: SizedBox(
            width: size.width * .7,
            child: Text(
              movie.title,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.backgroundPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Results movie;
  final Size size;

  const _PosterAndTitle({Key? key, required this.movie, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPath),
                height: 150,
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          SizedBox(
            width: size.width * .55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.originalTitle,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_outline,
                      color: Colors.grey,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      movie.voteAverage.toString(),
                      style: textTheme.caption,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  final String overview;

  const _OverView({Key? key, required this.overview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Text(
        overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
