import 'package:flutter/material.dart';
import 'package:movies_app/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies Online'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {  },
          )
        ],
      ),
      body: Column(
        children: const[
          CardSwiper()
        ],
      )
    );
  }
}
