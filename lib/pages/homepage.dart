import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
            title: const Text("Apple"),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              collapseMode: CollapseMode.parallax,
              background: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Word of the day",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: palette.onPrimaryContainer),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const WordOfTheDay(),
              ],
            ),
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

class WordOfTheDay extends StatelessWidget {
  const WordOfTheDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme? textTheme = Theme.of(context).textTheme;
    ColorScheme palette = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Apple",
                style: textTheme.displayMedium!.copyWith(
                  color: palette.primary,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {},
                color: palette.onPrimaryContainer,
                iconSize: 30,
                tooltip: "Speak",
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    palette.primaryContainer.withOpacity(0.3),
                  ),
                ),
                highlightColor: palette.primaryContainer,
                icon: const Icon(
                  Icons.mic_rounded,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          // ADD PHONETICS HERE
          const Text("apple"),
          // ADD DEFINITIONS
          const Text("Phonetics"),
          // ADD SYNONYMS HERE
          const Text("Synonym"),
        ],
      ),
    );
  }
}
