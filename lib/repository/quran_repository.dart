import 'package:http/http.dart' as http;

class QuranRepository {
  QuranRepository({required this.httpClient});

  final http.Client httpClient;

  // Future<List<Quran>> fetchQuran() async {
  //   final String jsonBundle =
  //       await rootBundle.loadString('assets/quran_audio.json');
  //   final results = await jsonDecode(jsonBundle) as List;

  //   return results.map((json) => Quran.fromJson(json)).toList();
  // }

  // List<String> getAudioUrls(Quran reciter) {
  //   final List<String> results = [];
  //   for (var index = 1; index <= 114; index++) {
  //     results.add(
  //       'https://cdn.islamic.network/quran/audio-surah/128/${reciter.identifier}/$index.mp3',
  //     );
  //   }

  //   return results;
  // }
}
