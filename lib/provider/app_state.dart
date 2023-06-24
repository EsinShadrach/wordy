import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wordy/utilities/title_string.dart';
import 'package:english_words/english_words.dart';

import '../api/api.dart';

class AppState extends ChangeNotifier {
  Map<String, String> partsOfSpeech = {
    'Noun': 'A word that represents a person, place, thing, or idea.',
    'Verb': 'A word that describes an action, occurrence, or state of being.',
    'Adjective': 'A word that describes or modifies a noun or pronoun.',
    'Adverb':
        'A word that describes or modifies a verb, adjective, or other adverb.',
    'Pronoun': 'A word that takes the place of a noun in a sentence.',
    'Preposition':
        'A word that shows the relationship between a noun (or pronoun) and other words in a sentence.',
    'Conjunction': 'A word that connects words, phrases, or clauses.',
    'Interjection':
        'A word or phrase that expresses strong emotion or surprise.',
    'Article': 'A word used to specify a noun as definite or indefinite.',
    'Determiner':
        'A word used to modify a noun and provide additional information.',
    'Numeral': 'A word used to express a number or numeral value.',
    'Particle':
        'A word that has a grammatical function but does not fit into traditional parts of speech.',
    'Infinitive': 'The base form of a verb, often preceded by "to."',
    'Gerund': 'A verb form that functions as a noun, ending in "-ing."',
    'Participle':
        'A verb form that can function as an adjective or part of a verb tense, often ending in "-ed" or "-ing."',
    'Modal': 'A verb that expresses possibility, necessity, or permission.',
    'Auxiliary':
        'A verb used in combination with a main verb to create different tenses, moods, or voices.',
    'Relative Pronoun':
        'A pronoun that introduces a relative clause, such as "who," "whom," or "which."',
    'Reflexive Pronoun':
        'A pronoun that reflects back to the subject of the sentence, ending in "-self" or "-selves."',
    'Reciprocal Pronoun':
        'A pronoun that expresses a mutual or reciprocal action between two or more subjects, such as "each other" or "one another."',
    'Intensive Pronoun':
        'A pronoun used for emphasis, emphasizing a noun or pronoun in the same sentence.',
    'Coordinating Conjunction':
        'A conjunction that connects words, phrases, or clauses of equal importance.',
    'Subordinating Conjunction':
        'A conjunction that connects a dependent clause to an independent clause.',
    'Correlative Conjunction':
        'A pair of conjunctions that work together to connect words, phrases, or clauses.',
    'Definite Article':
        'The article "the," used to specify a particular noun as definite.',
    'Indefinite Article':
        'The articles "a" or "an," used to specify a non-specific or general noun.',
    'Cardinal Number':
        'A number that represents a quantity or count, such as "one," "two," "three," etc.',
    'Ordinal Number':
        'A number that represents a position or order in a sequence, such as "first," "second," "third," etc.',
    'Demonstrative Pronoun':
        'A pronoun that points to or identifies a specific noun, such as "this," "that," "these," or "those."',
    'Exclamatory Pronoun':
        'A pronoun used to express strong emotion or surprise, such as "what" or "which."',
    'Indefinite Pronoun':
        'A pronoun that refers to non-specific or unidentified nouns, such as "someone," "anyone," "nothing," or "everything."',
    'Contraction':
        'A shortened form of two words created by combining them and replacing missing letters with an apostrophe, such as "can\'t" (can not), "it\'s" (it is), etc.',
    'Acronym':
        'An abbreviation formed by taking the initial letters of a phrase or name and pronouncing them as a word, such as "NASA" (National Aeronautics and Space Administration), "UNESCO" (United Nations Educational, Scientific and Cultural Organization), etc.',
  };

  List<String> history = [];
  Map<String, String?> dataForBottomSheet = {};
  var random = Random();

  String wordOfTheDay = generateWordPairs(
    maxSyllables: 30,
  ).first.first.titleCase();

  void addToHistory(String word) {
    if (!history.contains(word)) {
      history.add(word);
      notifyListeners();
    }
  }

  void deleteFromHistory(String word) {
    if (!history.contains(word)) {
      history.remove(word);
      notifyListeners();
    }
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

  Future<void> getWordData(String word) async {
    dynamic data = await WordData(word: word).getStructuredData();
    notifyListeners();
    return data;
  }
}
