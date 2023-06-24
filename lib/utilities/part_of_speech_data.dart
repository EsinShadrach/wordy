import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordy/provider/app_state.dart';

class PartsOfSpeechWidget extends StatelessWidget {
  const PartsOfSpeechWidget({
    super.key,
    required this.palette,
    required this.textTheme,
  });
  final ColorScheme palette;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    AppState appState = context.watch<AppState>();

    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${appState.dataForBottomSheet["partOfSpeech"]}",
            style: textTheme.headlineLarge!.copyWith(
              color: palette.onPrimaryContainer,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "${appState.dataForBottomSheet["definition"]}",
            style: textTheme.headlineSmall!.copyWith(
              color: palette.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
