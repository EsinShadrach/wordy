import 'package:flutter/material.dart';

class LexicalRelationPill extends StatelessWidget {
  const LexicalRelationPill({
    super.key,
    required this.palette,
    required this.lexicalRelation,
    required this.textTheme,
  });

  final ColorScheme palette;
  final String lexicalRelation;
  final TextTheme? textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: palette.secondary.withOpacity(0.4),
          width: 2,
        ),
      ),
      child: Text(
        lexicalRelation,
        style: textTheme!.labelLarge!.copyWith(
          color: palette.onSurface,
        ),
      ),
    );
  }
}
