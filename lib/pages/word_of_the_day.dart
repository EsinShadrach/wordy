import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy/provider/app_state.dart';
import 'package:wordy/utilities/phonetics.dart';

import '../utilities/word_and_phonetics.dart';
import '../utilities/word_card.dart';

class WordOfTheDay extends StatefulWidget {
  const WordOfTheDay({
    super.key,
  });

  @override
  State<WordOfTheDay> createState() => _WordOfTheDayState();
}

class _WordOfTheDayState extends State<WordOfTheDay> {
  @override
  void initState() {
    final appState = context.read<AppState>();
    appState.getWordOfTheDay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme? textTheme = Theme.of(context).textTheme;
    ColorScheme palette = Theme.of(context).colorScheme;
    AppState appState = context.watch<AppState>();
    var wordData = appState.wordOfTheDayData;
    if (wordData == null) {
      return LoadingCard(palette: palette);
    } else {
      return Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
                bottom: 70,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DefinedWord(
                    textTheme: textTheme,
                    palette: palette,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    runSpacing: 6,
                    spacing: 6,
                    children: [
                      Phonetics(
                        palette: palette,
                        textTheme: textTheme,
                        phonetics: wordData["phonetics"],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  for (var meaning in wordData["meanings"])
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: WordCard(
                        palette: palette,
                        appState: appState,
                        textTheme: textTheme,
                        partOfSpeech: "${meaning["partOfSpeech"]}",
                        definitions: meaning["definitions"],
                        synonyms: meaning["synonyms"],
                        antonym: meaning["antonyms"],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

class LoadingCard extends StatelessWidget {
  const LoadingCard({
    super.key,
    required this.palette,
  });

  final ColorScheme palette;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        height: double.infinity,
        constraints: const BoxConstraints(maxWidth: 450),
        decoration: BoxDecoration(
          color: palette.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: CircularProgressIndicator(
            color: palette.onPrimary,
          ),
        ),
      ),
    );
  }
}
/* 

      
 */