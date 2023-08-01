import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:wordy/provider/app_state.dart';

class DefinedWord extends StatefulWidget {
  const DefinedWord({
    super.key,
    required this.textTheme,
    required this.palette,
    required this.searchedFor,
    required this.detailedPage,
    this.wordData,
  });

  final TextTheme? textTheme;
  final dynamic wordData;
  final String searchedFor;
  final ColorScheme palette;
  final bool detailedPage;

  @override
  State<DefinedWord> createState() => _DefinedWordState();
}

class _DefinedWordState extends State<DefinedWord> {
  late final AudioPlayer audioPlayer;
  void playAudioFromUrl() async {
    String? url;
    List<dynamic> audios = widget.wordData["audios"];
    if (audios.isNotEmpty) {
      url = audios.firstWhere((audio) => audio.isNotEmpty, orElse: () => null);
    }
    if (url != null) {
      await audioPlayer.setUrl(url);
      audioPlayer.play();
    } else {
      // Handle the case when no audio URL is available
      print("No audio URL available for ${widget.searchedFor}");
    }
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.searchedFor,
          style: widget.textTheme!.displayMedium!,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {
            playAudioFromUrl();
          },
          iconSize: 30,
          tooltip: "Speak",
          highlightColor: context.colorscheme.onSurface.withOpacity(0.2),
          icon: const Icon(
            Icons.mic_rounded,
          ),
        ),
        widget.detailedPage
            ? Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      appState.toggleFavourite(widget.searchedFor);
                    },
                    highlightColor:
                        context.colorscheme.primary.withOpacity(0.2),
                    color: context.colorscheme.primary,
                    icon: Icon(
                      appState.getFavouriteStatus(widget.searchedFor)
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline,
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}

extension ThemesExtension on BuildContext {
  ColorScheme get colorscheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
