import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:quran_pod/models/quran_audio.dart';
import 'package:quran_pod/repository/quran_repository.dart';

enum AudioState { playing, paused, stopped }

class AudioProvider extends ChangeNotifier {
  // final _audioPlayer = AudioPlayer();
  // final bool _isPlaying = false;

  final quranRepository = QuranRepository(httpClient: Client());
  final _assetAudioPlayer = AssetsAudioPlayer();

  List<Quran> qurans = [];

  List<String> audioUrls = [];

  var _currentAssetPosition = 0;

  final http.Client httpClient;

  AudioProvider(this.httpClient);

  Future<List<Quran>> fetchQuran() async {
    final String jsonBundle =
        await rootBundle.loadString('assets/quran_audio.json');
    final results = await jsonDecode(jsonBundle) as List;
    notifyListeners();
    return results.map((json) => Quran.fromJson(json)).toList();
  }

  void open(int quranIndex) async {
    // final fetchedQurans = await quranRepository.fetchQuran();
    qurans = await fetchQuran();
    _currentAssetPosition = quranIndex % 114;
    //  % qurans.length;
    _assetAudioPlayer.open(
      Audio.network(
        'https://cdn.islamic.network/quran/audio-surah/128/${qurans[_currentAssetPosition].identifier}/${_currentAssetPosition + 1}.mp3',
        metas: Metas(
          artist: qurans[_currentAssetPosition].englishName,
        ),
      ),
      showNotification: true,
      loopMode: LoopMode.playlist,
    );
    notifyListeners();
  }

  void playPause() {
    _assetAudioPlayer.playOrPause();
    notifyListeners();
  }

  void next() {
    _currentAssetPosition++;
    open(_currentAssetPosition + 1);
    notifyListeners();
  }

  void prev() {
    _currentAssetPosition--;
    open(_currentAssetPosition - 1);
    notifyListeners();
  }

  void close() {
    _assetAudioPlayer.stop();
  }

  // void getQuranAudiosUrl() async {
  //   qurans = await quranRepository.fetchQuran();
  //   for (var index = 1; index <= qurans.length; index++) {
  //     audioUrls.add(
  //       'https://cdn.islamic.network/quran/audio-surah/128/${qurans[index].identifier}.identifier}/$index.mp3',
  //     );
  //   }
  // }

  // void playAudio(int index) async {
  //   try {
  //     _audioPlayer.setSourceUrl(audioUrls[index]);
  //   } catch (_) {}

  //   notifyListeners();
  // }

  // bool get isPlaying => _isPlaying;

  // void playAudio() {}
}
