import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy/provider/app_state.dart';
import 'package:wordy/utilities/phonetics.dart';

import '../utilities/word_and_phonetics.dart';
import '../utilities/word_card.dart';

class WordOfTheDay extends StatelessWidget {
  const WordOfTheDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme? textTheme = Theme.of(context).textTheme;
    ColorScheme palette = Theme.of(context).colorScheme;
    AppState appState = context.watch<AppState>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
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
              for (int i = 0; i < 5; i++)
                Phonetics(
                  palette: palette,
                  textTheme: textTheme,
                ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          WordCard(
            palette: palette,
            appState: appState,
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
}
