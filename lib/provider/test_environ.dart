// ignore_for_file: avoid_print

void main(List<String> args) {
  List<Map<String, Object>> data = [
    {
      "name": "item1",
      "inHistory": true,
      "inFavourite": true,
    },
    {
      "name": "item2",
      "inHistory": true,
      "inFavourite": false,
    }
  ];

  void toggleFavourite(word) {
    Map<String, Object> listItem = data.firstWhere(
      (element) => element["name"] == word,
    );
    if (listItem["inFavourite"] as bool) {
      listItem["inFavourite"] = false;
    } else {
      listItem["inFavourite"] = true;
    }
  }

  toggleFavourite("item1");
  print(data);
}
