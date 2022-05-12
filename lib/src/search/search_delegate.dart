import 'package:flutter/material.dart';
import 'package:movies_app/src/models/models.dart';
import 'package:movies_app/src/provider/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Search Movie...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  showIcon(IconData icon) {
    return Center(
        child: Icon(
      icon,
      color: Colors.black38,
      size: 100,
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return showIcon(Icons.movie_creation_outlined);
    }
    final provider = Provider.of<MoviesProvider>(context, listen: false);
    provider.getSuggestionsByQuery(query);

    return StreamBuilder(
        stream: provider.suggestionsStream,
        builder: (_, AsyncSnapshot<List<Results>?> snapshot) {
          if (!snapshot.hasData) {
            return showIcon(Icons.search_off_outlined);
          }
          return ListView.builder(
              itemCount: snapshot.data!.length, itemBuilder: (_, int index) => _MovieItemView(movie: snapshot.data![index],));
        });
  }
}

class _MovieItemView extends StatelessWidget {
  final Results movie;

  const _MovieItemView ({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movie.heroId = "search-${movie.id}";
    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage( movie.fullPath),
          width:50,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(movie.title),
      onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
    );
  }
}

