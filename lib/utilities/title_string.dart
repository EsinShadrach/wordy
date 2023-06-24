extension StringExtension on String {
  String titleCase() {
    return replaceAllMapped(
      RegExp(r"(^|\s)\w"),
      (match) => match.group(0)!.toUpperCase(),
    );
  }
}
