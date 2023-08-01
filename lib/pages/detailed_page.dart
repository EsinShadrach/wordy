import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy/provider/app_state.dart';
import 'package:wordy/utilities/loading_state.dart';
import 'package:wordy/utilities/phonetics.dart';
import 'package:wordy/utilities/word_and_phonetics.dart';
import 'package:wordy/utilities/word_card.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({super.key});

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  late String searchFor;
  dynamic wordData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    searchFor = ModalRoute.of(context)?.settings.arguments as String;
    Provider.of<AppState>(context, listen: false).getWord(word: searchFor);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme? textTheme = Theme.of(context).textTheme;
    ColorScheme palette = Theme.of(context).colorScheme;
    return Consumer<AppState>(builder: (context, provider, _) {
      wordData = provider.neededWord;
      if (wordData == null) {
        return Scaffold(
          body: Center(
            child: Text("Looking for word $searchFor"),
          ),
        );
      } else if (wordData["word"] != searchFor) {
        return LoadingState(palette: palette);
      }
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
                    searchedFor: searchFor,
                    textTheme: textTheme,
                    palette: palette,
                    wordData: wordData,
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
                        appState: provider,
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
    });
  }
}
