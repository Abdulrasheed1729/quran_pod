enum AudioState { playing, paused, stopped }

// class AudioProvider extends ChangeNotifier {
//   // final _audioPlayer = AudioPlayer();
//   // final bool _isPlaying = false;

//   final quranRepository = QuranRepository(httpClient: Client());
//   final _assetAudioPlayer = AudioPlayer();

//   List<Quran> qurans = [];

//   List<String> audioUrls = [];

//   var _currentAssetPosition = 0;

//   final http.Client httpClient;

//   AudioProvider(this.httpClient);

  // Future<List<Quran>> fetchQuran() async {
  //   final String jsonBundle =
  //       await rootBundle.loadString('assets/quran_audio.json');
  //   final results = await jsonDecode(jsonBundle) as List;
  //   notifyListeners();
  //   return results.map((json) => Quran.fromJson(json)).toList();
  // }

//   void open(int quranIndex, Quran quran) async {
//     // final fetchedQurans = await quranRepository.fetchQuran();
//     qurans = await fetchQuran();
//     _currentAssetPosition = quranIndex % 114;
//     //  % qurans.length;
//     await _assetAudioPlayer.setUrl(
//       // 'https://cdn.islamic.network/quran/audio-surah/128/${quran.identifier}/$_currentAssetPosition.mp3',
//     );
//     // await _assetAudioPlayer.play();
//     notifyListeners();
//   }

//   void play() {
//     _assetAudioPlayer.play();
//     notifyListeners();
//   }

//   void pause() {
//     _assetAudioPlayer.pause();
//   }

//   void next(Quran quran) {
//     _currentAssetPosition++;
//     open(_currentAssetPosition, quran);
//     notifyListeners();
//   }

//   void prev(Quran quran) {
//     _currentAssetPosition--;
//     open(_currentAssetPosition, quran);
//     notifyListeners();
//   }

//   void close() {
//     _assetAudioPlayer.stop();
//   }

//   // void getQuranAudiosUrl() async {
//   //   qurans = await quranRepository.fetchQuran();
//   //   for (var index = 1; index <= qurans.length; index++) {
//   //     audioUrls.add(
//   //       'https://cdn.islamic.network/quran/audio-surah/128/${qurans[index].identifier}.identifier}/$index.mp3',
//   //     );
//   //   }
//   // }

//   // void playAudio(int index) async {
//   //   try {
//   //     _audioPlayer.setSourceUrl(audioUrls[index]);
//   //   } catch (_) {}

//   //   notifyListeners();
//   // }

//   // bool get isPlaying => _isPlaying;

//   // void playAudio() {}
// }
