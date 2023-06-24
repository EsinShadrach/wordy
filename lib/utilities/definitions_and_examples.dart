import 'package:flutter/material.dart';

class DefinitionAndExamplesWidget extends StatelessWidget {
  const DefinitionAndExamplesWidget({
    super.key,
    required this.textTheme,
    required this.palette,
    required this.definition,
    required this.example,
  });

  final TextTheme? textTheme;
  final ColorScheme palette;
  final String definition;
  final String example;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            definition,
            style: textTheme!.bodyLarge!.copyWith(
              color: palette.onPrimary,
            ),
          ),
          example.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Example: ",
                      style: textTheme!.bodyLarge!.copyWith(
                        color: palette.onPrimary,
                      ),
                    ),
                    Text(
                      example,
                      style: textTheme!.bodyLarge!.copyWith(
                        color: palette.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
