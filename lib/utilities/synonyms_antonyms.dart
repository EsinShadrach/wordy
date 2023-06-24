import 'package:flutter/material.dart';

import 'lexical_relation_card.dart';

class SynonymAndAntonymWidget extends StatelessWidget {
  const SynonymAndAntonymWidget({
    super.key,
    required this.textTheme,
    required this.palette,
    required this.lexicalRelation,
    this.lexicalRelations,
  });

  final TextTheme? textTheme;
  final ColorScheme palette;
  final String lexicalRelation;
  final List<dynamic>? lexicalRelations;

  @override
  Widget build(BuildContext context) {
    if (lexicalRelations!.isNotEmpty) {
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
              for (String lexicalRelation in lexicalRelations!)
                LexicalRelationCard(
                  palette: palette,
                  lexicalRelation: lexicalRelation,
                  textTheme: textTheme,
                ),
            ],
          )
        ],
      );
    }
    return Container();
  }
}

