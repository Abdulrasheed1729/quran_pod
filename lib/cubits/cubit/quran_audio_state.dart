part of 'quran_audio_cubit.dart';

abstract class QuranAudioState extends Equatable {
  const QuranAudioState();

  @override
  List<Object> get props => [];
}

class QuranAudioInitial extends QuranAudioState {}

class QuranAudioLoaded extends QuranAudioState {
  final List<QuranAudio> quranAudio;

  const QuranAudioLoaded(this.quranAudio);

  @override
  List<Object> get props => [quranAudio];
}
