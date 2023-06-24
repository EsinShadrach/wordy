import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy/pages/word_of_the_day.dart';
import 'package:wordy/provider/app_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    ColorScheme palette = Theme.of(context).colorScheme;
    TextTheme? textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: palette.inversePrimary,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Open Drawer
              },
            ),
            centerTitle: true,
            expandedHeight: 310,
            pinned: true,
            titleTextStyle: textTheme.displaySmall!
                .copyWith(color: palette.onPrimaryContainer),
            title: Text(appState.wordOfTheDay),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              collapseMode: CollapseMode.parallax,
              background: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Word of the day",
                    style: textTheme.headlineLarge!.copyWith(
                      color: palette.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: WordOfTheDay(),
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // OnClick Redirect to Search Page
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
