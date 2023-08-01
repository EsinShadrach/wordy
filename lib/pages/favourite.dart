import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy/provider/app_state.dart';
import 'package:wordy/utilities/favourite_or_history.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    AppState appState = context.watch<AppState>();
    List<Map<String, dynamic>> favourites = appState.getOnlyFavourite();
    return FavouriteOrHistory(
      fromWhere: "Favourites",
      items: favourites,
      icon: Icons.favorite_rounded,
    );
  }
}
