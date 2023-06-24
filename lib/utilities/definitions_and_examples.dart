import 'package:flutter/material.dart';

class DefinitionAndExamplesWidget extends StatelessWidget {
  const DefinitionAndExamplesWidget({
    super.key,
    required this.textTheme,
    required this.palette,
  });

  final TextTheme? textTheme;
  final ColorScheme palette;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "The smallest unit of language that has a particular meaning and can be expressed by itself; the smallest discrete, meaningful unit of language. (contrast morpheme.)",
            style: textTheme!.bodyLarge!.copyWith(
              color: palette.onPrimary,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Examples: ",
                style: textTheme!.bodyLarge!.copyWith(
                  color: palette.onPrimary,
                ),
              ),
              Text(
                "- A proverb or motto.",
                style: textTheme!.bodyLarge!.copyWith(
                    color: palette.onPrimary, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
