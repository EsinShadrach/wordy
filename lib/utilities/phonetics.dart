import 'package:flutter/material.dart';

class Phonetics extends StatelessWidget {
  const Phonetics({
    super.key,
    required this.palette,
    required this.textTheme,
  });

  final ColorScheme palette;
  final TextTheme? textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: palette.primary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: palette.onPrimary, width: 2),
      ),
      padding: const EdgeInsets.all(5),
      child: Text(
        "/wɜːd/",
        style: textTheme!.headlineSmall!.copyWith(
          color: palette.onPrimary,
        ),
      ),
    );
  }
}
