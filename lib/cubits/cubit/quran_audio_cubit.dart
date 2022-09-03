import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quran_pod/models/quran_audio.dart';
import 'package:quran_pod/repository/quran_repository.dart';

part 'quran_audio_state.dart';

const String jsonUrl =
    'https://raw.githubusercontent.com/islamic-network/cdn/master/info/cdn_surah_audio.json';

class QuranAudioCubit extends Cubit<QuranAudioState> {
  QuranAudioCubit({required this.quranRepository}) : super(QuranAudioInitial());
  final QuranRepository quranRepository;
  List<QuranAudio> response = [];

  Future<void> loadQuranAudios() async {
    try {
      response = await quranRepository.fetchQuranAudios();
      emit(QuranAudioLoaded(response));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
