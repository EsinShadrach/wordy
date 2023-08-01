import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:wordy/pages/favourite.dart';
import 'package:wordy/pages/history.dart';
import 'package:wordy/pages/word_of_the_day.dart';

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
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Word Of The Day",
          baseStyle: const TextStyle(),
          selectedStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const WordOfTheDay(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Favourite",
          baseStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          selectedStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const Favourite(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "History",
          baseStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          selectedStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const History(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme palette = Theme.of(context).colorScheme;
    return Scaffold(
      body: HiddenDrawerMenu(
        backgroundColorMenu: palette.inversePrimary,
        backgroundColorAppBar: palette.onPrimary,
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
