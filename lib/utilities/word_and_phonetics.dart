import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:wordy/provider/app_state.dart';

class DefinedWord extends StatefulWidget {
  const DefinedWord({
    super.key,
    required this.textTheme,
    required this.palette,
  });

  final TextTheme? textTheme;
  final ColorScheme palette;

  @override
  State<DefinedWord> createState() => _DefinedWordState();
}

class _DefinedWordState extends State<DefinedWord> {
  late final AudioPlayer audioPlayer;

  void playAudioFromUrl(String url) async {
    await audioPlayer.setUrl(url);
    audioPlayer.play();
  }

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppState appState = context.watch<AppState>();
    var wordData = appState.wordOfTheDayData;
    String word = '';
    wordData["audios"].forEach(
      (String audio) => {
        if (audio.isNotEmpty) word = audio,
      },
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          appState.wordOfTheDay,
          style: widget.textTheme!.displayMedium!.copyWith(
            color: widget.palette.primary,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {
            playAudioFromUrl(word);
          },
          color: widget.palette.onPrimaryContainer,
          iconSize: 30,
          tooltip: "Speak",
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              widget.palette.primaryContainer.withOpacity(0.3),
            ),
          ),
          highlightColor: widget.palette.primaryContainer,
          icon: const Icon(
            Icons.mic_rounded,
          ),
        )
      ],
    );
  }
}
