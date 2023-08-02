import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:wordy/pages/favourite.dart';
import 'package:wordy/pages/history.dart';
import 'package:wordy/pages/word_of_the_day.dart';
import 'package:wordy/utilities/word_and_phonetics.dart';

class HiddenDrawerWidget extends StatefulWidget {
  const HiddenDrawerWidget({super.key});

  @override
  State<HiddenDrawerWidget> createState() => _HiddenDrawerWidgetState();
}

class _HiddenDrawerWidgetState extends State<HiddenDrawerWidget> {
  late List<ScreenHiddenDrawer> _pages;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: context.colorscheme.tertiary,
          name: "Word Of The Day",
          baseStyle: const TextStyle(),
          selectedStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: 14,
          ),
        ),
        const WordOfTheDay(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: context.colorscheme.tertiary,
          name: "Favourite",
          baseStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          selectedStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: 14,
          ),
        ),
        const Favourite(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: context.colorscheme.tertiary,
          name: "History",
          baseStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          selectedStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: 14,
          ),
        ),
        const History(),
      ),
    ];

    ColorScheme palette = Theme.of(context).colorScheme;
    return Scaffold(
      body: HiddenDrawerMenu(
        backgroundColorMenu: palette.inversePrimary,
        backgroundColorAppBar: palette.inversePrimary,
        screens: _pages,
        isTitleCentered: true,
        slidePercent: 40,
        verticalScalePercent: 90,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/search');
        },
        backgroundColor: palette.primary,
        label: Text(
          "Search",
          style: TextStyle(
            color: palette.onPrimary,
          ),
        ),
        icon: Icon(
          Icons.search_rounded,
          color: palette.onPrimary,
        ),
        autofocus: true,
        tooltip: "Search",
      ),
    );
  }
}

// ADD A sort fo Caching, where we check if a 
//user have visited the word, if so then we show
//that word instead of getting the word again
