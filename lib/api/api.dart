// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class WordData {
  String? word;
  WordData({this.word});

  /// *  This get's `all the data` from the API
  Future<dynamic> fetchAllData() async {
    String link = 'https://api.dictionaryapi.dev/api/v2/entries/en/$word';
    final url = Uri.parse(link);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);

        final wordData = jsonResponse[0];

        await File('data.json').writeAsString(jsonEncode(wordData));
        print('Data written to file: data.json');
        return wordData; // Return the fetched word data
      }
    } catch (error) {
      print("ERROR OCCURRED WHILE LOOKING FOR DATA");
    }

    return null;
  }

  /// *  Most words usually have `2 phonetics text` this returns a list of them
  Future<List> getPhonetics() async {
    List<String> allPhonetics = [];
    var data = await fetchAllData();
    List<dynamic> phonetics = data["phonetics"];

    for (var phonetic in phonetics) {
      allPhonetics.add(phonetic["text"]);
    }
    return allPhonetics;
  }

  /// *  Most words usually have 2 audio files url returns a list of those audio file
  Future<List> getAudios() async {
    List<String> allAudios = [];
    var data = await fetchAllData();
    List<dynamic> audios = data["phonetics"];

    for (var audio in audios) {
      allAudios.add(audio["audio"]);
    }
    return allAudios;
  }

  Future<List> getMeanings() async {
    var data = await fetchAllData();
    List<dynamic> meanings = data["meanings"];
    return meanings;
  }
}

void main() async {
  WordData getWordData = WordData(word: "Word");
  List phonetic = await getWordData.getMeanings();
  print(phonetic);
}
