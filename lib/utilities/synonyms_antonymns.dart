import 'package:flutter/material.dart';

class SynonymAndAntonymWidget extends StatelessWidget {
  const SynonymAndAntonymWidget({
    super.key,
    required this.textTheme,
    required this.palette,
    required this.lexicalRelation,
  });

  final TextTheme? textTheme;
  final ColorScheme palette;
  final String lexicalRelation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$lexicalRelation:",
          style: textTheme!.titleLarge!.copyWith(
            color: palette.onPrimary,
          ),
        ),
        const SizedBox(height: 7),
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: [
            for (int i = 0; i < 5; i++)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: palette.background,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: palette.inversePrimary,
                    width: 2,
                  ),
                ),
                child: Text(
                  "bottle",
                  style: textTheme!.labelLarge!.copyWith(
                    color: palette.onBackground,
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }
}
