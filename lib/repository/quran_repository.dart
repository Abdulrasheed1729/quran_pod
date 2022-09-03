import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:quran_pod/models/quran_audio.dart';

class QuranRepository {
  QuranRepository({required this.httpClient});

  final http.Client httpClient;

  Future<List<QuranAudio>> fetchQuranAudios() async {
    final String jsonBundle =
        await rootBundle.loadString('assets/quran_audio.json');
    final results = await jsonDecode(jsonBundle) as List;

    return results.map((json) => QuranAudio.fromJson(json)).toList();
  }

  Future<void> getAudio() async {
    final quranAudio = await fetchQuranAudios();

    for (var reciter in quranAudio) {
      for (var index = 1; index <= 114; index++) {
        try {
          http.get(
            Uri.parse(
              'https://cdn.islamic.network/quran/audio-surah/128/${reciter.identifier}/$index.mp3',
            ),
          );
        } catch (e) {
          debugPrint;
        }
      }
    }
  }
}
