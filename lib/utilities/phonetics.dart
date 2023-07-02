import 'package:flutter/material.dart';
import 'package:wordy/utilities/word_and_phonetics.dart';

class Phonetics extends StatelessWidget {
  const Phonetics({
    super.key,
    required this.palette,
    required this.textTheme,
    this.phonetics,
  });

  final ColorScheme palette;
  final TextTheme? textTheme;
  final List? phonetics;

  @override
  Widget build(BuildContext context) {
    for (String phonetic in phonetics!) {
      return Container(
        decoration: BoxDecoration(
          color: context.colorscheme.primary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: palette.onPrimary, width: 2),
        ),
        padding: const EdgeInsets.all(5),
        child: Text(
          phonetic,
          style: textTheme!.headlineSmall!.copyWith(
            color: context.colorscheme.onPrimary,
          ),
        ),
      );
    }
    return Container();
  }
}
