import 'package:flutter/material.dart';
import 'package:movies_app/src/models/now_playing_response.dart';

class MovieSlider extends StatefulWidget {
  final List<Results> movies;
  final String title;
  final Function onNextPage;

  const MovieSlider({Key? key, required this.title, required this.movies, required this.onNextPage })
      : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.position.maxScrollExtent <= (controller.position.pixels + 300)) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Expanded(
              child: widget.movies == null || widget.movies.isEmpty
                  ? blank()
                  : getMovies())
        ],
      ),
    );
  }

  getMovies() {
    return ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: widget.movies.length,
        itemBuilder: (_, int index) =>
            _MoviePoster(movie: widget.movies[index], tag: widget.title.toLowerCase().trim()));
  }

  blank() {
    return const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(),
        )));
  }
}

class _MoviePoster extends StatelessWidget {
  final Results movie;
  final String tag;

  const _MoviePoster({Key? key, required this.movie, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movie.heroId = "slider-${movie.id}";
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.9),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPath),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
