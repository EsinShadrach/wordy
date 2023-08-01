import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy/provider/app_state.dart';
import 'package:wordy/utilities/favourite_or_history.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    AppState appState = context.watch<AppState>();
    List<Map<String, dynamic>> favourites = appState.getOnlyHistory();
    return FavouriteOrHistory(
      fromWhere: "History",
      items: favourites,
      icon: Icons.history_rounded,
    );
  }
}
