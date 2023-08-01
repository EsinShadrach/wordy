import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy/provider/app_state.dart';
import 'package:wordy/utilities/delete_modal.dart';
import 'package:wordy/utilities/word_and_phonetics.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    AppState appState = context.watch<AppState>();
    List<Map<String, dynamic>> favourites = appState.getOnlyFavourite();
    return FavouriteOrHistory(
      fromWhere: "Favourites",
      items: favourites,
    );
  }
}

class FavouriteOrHistory extends StatelessWidget {
  const FavouriteOrHistory({
    super.key,
    required this.items,
    required this.fromWhere,
  });
  final List<Map<String, dynamic>> items;
  final String fromWhere;

  @override
  Widget build(BuildContext context) {
    AppState appState = context.watch<AppState>();
    ColorScheme palette = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;

    if (items.isEmpty) {
      return Scaffold(
        body: SizedBox(
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                color: palette.primary,
                size: 32,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "$fromWhere is empty.",
                style: textTheme.headlineLarge!.copyWith(
                  // color: palette.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: ListTile(
                leading: Icon(Icons.favorite, color: palette.primary),
                title: Text("${items[index]["name"]}"),
                tileColor: context.colorscheme.primaryContainer.withOpacity(
                  0.2,
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/detailed',
                    arguments: items[index]["name"],
                  );
                },
                onLongPress: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DeleteModal(
                        objectName: items[index]["name"],
                        fromWhere: fromWhere.toLowerCase(),
                        deleteAction: () {
                          appState.toggleFavourite(items[index]["name"]);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(milliseconds: 300),
                              content: Text(
                                "Removed ${items[index]["name"]} from favourites",
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
