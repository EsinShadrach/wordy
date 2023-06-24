import 'package:flutter/material.dart';
import 'package:wordy/provider/app_state.dart';
import 'package:wordy/utilities/part_of_speech_button.dart';
import 'package:wordy/utilities/title_string.dart';

import 'definitions_and_examples.dart';
import 'synonyms_antonyms.dart';

class WordCard extends StatelessWidget {
  const WordCard({
    super.key,
    required this.palette,
    required this.appState,
    required this.textTheme,
    required this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonym,
  });

  final ColorScheme palette;
  final AppState appState;
  final TextTheme? textTheme;
  final String partOfSpeech;
  final List? definitions;
  final List? synonyms;
  final List? antonym;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          PartOfSpeechButton(
            appState: appState,
            palette: palette,
            textTheme: textTheme,
            partOfSpeech: partOfSpeech,
          ),
          for (var definition in definitions!)
            DefinitionAndExamplesWidget(
              textTheme: textTheme,
              palette: palette,
              definition: definition["definition"],
              example: definition["example"] ?? "",
            ),
          synonyms!.isNotEmpty && antonym!.isNotEmpty
              ? Divider(
                  height: 20,
                  indent: 20,
                  endIndent: 20,
                  color: palette.onPrimary.withOpacity(0.6),
                  thickness: 2,
                )
              : Container(),
          SynonymAndAntonymWidget(
            textTheme: textTheme,
            palette: palette,
            lexicalRelation: "Synonym".titleCase(),
            lexicalRelations: synonyms,
          ),
          const SizedBox(height: 10),
          SynonymAndAntonymWidget(
            textTheme: textTheme,
            palette: palette,
            lexicalRelation: "Antonym".titleCase(),
            lexicalRelations: antonym,
          ),
        ],
      ),
    );
  }
}
