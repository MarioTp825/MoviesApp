import 'package:flutter/material.dart';
import 'package:movies_app/src/models/models.dart';
import 'package:swipe_cards/swipe_cards.dart';

class CardSwiper extends StatelessWidget {
  final List<Results> items;

  const CardSwiper({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: size.width * .8,
          height: size.height * .5,
          child: items == null || items.isEmpty? emptyCard() : getCards(context)
        ),
      ),
    );
  }

  emptyCard() {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(),
        )
      )
    );
  }

  getCards(BuildContext context) {
    final movies = getItems();
    final engine = MatchEngine(swipeItems: movies);
    return SwipeCards(
      matchEngine: engine,
      itemBuilder: (_, int index) {
        final movie = cast<MovieCard>(movies[index].content)!;
        items[index].heroId = "swiper-${items[index].id}";
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'details', arguments: items[index]),
          child: Hero(
            tag: items[index].heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.img),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      onStackFinished: stackFinished,
      itemChanged: onItemChanged,
      upSwipeAllowed: true,
      fillSpace: true,
    );
  }

  stackFinished() {
    //TODO on finished
  }

  T? cast<T>(x) => x is T ? x : null;

  onItemChanged(SwipeItem p1, int p2) {
    //TODO Item changed
  }

  List<SwipeItem> getItems() {
    return [
      for (var item in items)
        SwipeItem(
            content: MovieCard(
                img: item.fullPath, title: item.title))
    ];
  }
}
