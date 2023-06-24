import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy/provider/app_state.dart';

class DefinedWord extends StatelessWidget {
  const DefinedWord({
    super.key,
    required this.textTheme,
    required this.palette,
  });

  final TextTheme? textTheme;
  final ColorScheme palette;

  @override
  Widget build(BuildContext context) {
    AppState appState = context.watch<AppState>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          appState.wordOfTheDay,
          style: textTheme!.displayMedium!.copyWith(
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
    );
  }
}
