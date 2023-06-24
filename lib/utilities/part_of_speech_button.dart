import 'package:flutter/material.dart';
import 'package:wordy/provider/app_state.dart';
import 'package:wordy/utilities/part_of_speech_data.dart';
import 'package:wordy/utilities/title_string.dart';

class PartOfSpeechButton extends StatelessWidget {
  const PartOfSpeechButton({
    super.key,
    required this.appState,
    required this.palette,
    required this.textTheme,
    required this.partOfSpeech,
  });

  final AppState appState;
  final ColorScheme palette;
  final TextTheme? textTheme;
  final String partOfSpeech;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        appState.setPartOfSpeech(partOfSpeech);
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
              textTheme: textTheme!,
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
          textTheme!.headlineMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: Text(
        partOfSpeech.titleCase(),
      ),
    );
  }
}
