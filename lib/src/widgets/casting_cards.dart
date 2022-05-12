import 'package:flutter/material.dart';
import 'package:movies_app/src/models/credits_response.dart';
import 'package:provider/provider.dart';

import '../provider/movies_provider.dart';
class CastingCards extends StatelessWidget {
  final int id;

  const CastingCards({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return FutureBuilder(
      future: moviesProvider.getActors(id),
      builder: (_, AsyncSnapshot<List<Cast>?> snapshot) {
        return Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 180,
            child: snapshot.hasData ? getCast(snapshot.data!) : empty()
        );
      },
    );
  }

  getCast(List<Cast> cast) {
    return ListView.builder(
        itemCount: cast.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) {
          return _CastCard(actor: cast[index]);
        }
    );
  }

  empty() {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;

  const _CastCard({Key? key, required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(actor.profilePath),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
