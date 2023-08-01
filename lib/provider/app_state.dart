import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wordy/constants/constants.dart';
import 'package:wordy/provider/partOfSpeech.dart';
import 'package:wordy/utilities/title_string.dart';
import 'package:english_words/english_words.dart';

import '../api/api.dart';

class AppState extends ChangeNotifier {
  List<Map<String, dynamic>> history = [];
  Map<String, String?> dataForBottomSheet = {};
  var random = Random();
  dynamic wordOfTheDayData;
  dynamic neededWord;

  String wordOfTheDay = generateWordPairs(
    maxSyllables: 30,
  ).first.first.titleCase();

  void addToHistory(Map<String, dynamic> word) {
    String wordString = word.toString();
    if (!history.any((item) => item.toString() == wordString)) {
      history.add(word);
      notifyListeners();
    }
  }

  void toggleFavourite(String word) {
    Map<String, dynamic> listItem = history.firstWhere(
      (element) => element["name"] == word,
    );
    if (listItem["inFavourite"] as bool) {
      listItem["inFavourite"] = false;
    } else {
      listItem["inFavourite"] = true;
    }
    notifyListeners();
  }

  bool getFavouriteStatus(String word) {
    Map<String, dynamic> item =
        history.firstWhere((element) => element["name"] == word);
    return item["inFavourite"];
  }

  List<Map<String, dynamic>> getOnlyFavourite() {
    return history.where((element) => element["inFavourite"]).toList();
  }

  List<Map<String, dynamic>> getOnlyHistory() {
    return history.where((element) => element["inHistory"]).toList();
  }

  void deleteFromHistory(int index) {
    history.removeAt(index);
    notifyListeners();
  }

  void clearHistory() {
    history.clear();
    notifyListeners();
  }

  void setPartOfSpeech(String speech) {
    dataForBottomSheet = {
      "partOfSpeech": speech.titleCase(),
      "definition": partsOfSpeech[speech.titleCase()],
    };
    notifyListeners();
  }

  Future<void> getWordOfTheDay() async {
    try {
      String word = wordOfTheDay;
      dynamic data = await WordData(word: word).getStructuredData();
      wordOfTheDayData = data;
      redPrint(wordOfTheDay);
      notifyListeners();
    } catch (error) {
      redPrint(error);
    }
  }

  Future<void> getWord({required String word}) async {
    try {
      dynamic data = await WordData(word: word).getStructuredData();
      neededWord = data;
    } catch (error) {
      neededWord = null;
      redPrint(error);
    }
    notifyListeners();
  }
}
