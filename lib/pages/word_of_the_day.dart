import 'package:flutter/material.dart';
import 'package:wordy/utilities/definitions_and_examples.dart';
import 'package:wordy/utilities/part_of_speech_data.dart';
import 'package:wordy/utilities/synonyms_antonymns.dart';
import 'package:provider/provider.dart';
import 'package:wordy/provider/app_state.dart';

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Word".titleCase(),
                style: textTheme.displayMedium!.copyWith(
                  color: palette.primary,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  // Play audio here
                },
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
            height: 10,
          ),
          Wrap(
            runSpacing: 6,
            spacing: 6,
            children: [
              for (int i = 0; i < 5; i++)
                Container(
                  decoration: BoxDecoration(
                    color: palette.primary,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: palette.onPrimary, width: 2),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "/wɜːd/",
                    style: textTheme.headlineSmall!.copyWith(
                      color: palette.onPrimary,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(13),
            constraints: const BoxConstraints(
              maxWidth: 450,
            ),
            decoration: BoxDecoration(
              color: palette.primary,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: palette.onPrimary, width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    appState.setPartOfSpeech("Noun");
                    showModalBottomSheet(
                      showDragHandle: true,
                      backgroundColor: palette.primaryContainer,
                      constraints: const BoxConstraints(
                        maxWidth: 450,
                      ),
                      context: context,
                      builder: (context) {
                        return PartsOfSpeechWidget(
                          palette: palette,
                          textTheme: textTheme,
                        );
                      },
                    );
                  },
                  style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
                    foregroundColor: MaterialStatePropertyAll(
                      palette.onPrimary,
                    ),
                    textStyle: MaterialStatePropertyAll(
                      textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  child: const Text("Noun"),
                ),
                DefinitionAndExamplesWidget(
                  textTheme: textTheme,
                  palette: palette,
                ),
                Divider(
                  height: 20,
                  indent: 20,
                  endIndent: 20,
                  color: palette.onPrimary.withOpacity(0.6),
                  thickness: 2,
                ),
                SynonymAndAntonymWidget(
                  textTheme: textTheme,
                  palette: palette,
                  lexicalRelation: "Synonym".titleCase(),
                ),
                const SizedBox(height: 10),
                SynonymAndAntonymWidget(
                  textTheme: textTheme,
                  palette: palette,
                  lexicalRelation: "Antonym".titleCase(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
