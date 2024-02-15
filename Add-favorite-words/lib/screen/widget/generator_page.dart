import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../notifers/my_app_state.dart';
import 'big_card.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favourite.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("A random AWESOME idea"),
          BigCard(
            pair: pair,
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(mainAxisSize: MainAxisSize.min, children: [
            // ↓ And this.
            ElevatedButton.icon(
              onPressed: () {
                appState.triggerFavourite();
              },
              icon: Icon(icon),
              label: Text('Like'),
            ),
            SizedBox(width: 10),

            ElevatedButton(
              onPressed: () {
                appState.getNext();
              },
              child: Text('Next'),
            ),
          ])
        ],
      ),
    );
  }
}
