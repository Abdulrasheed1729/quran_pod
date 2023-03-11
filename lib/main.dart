import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'quran_pod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidShowNotificationBadge: true,
    androidNotificationOngoing: true,
  );
  runApp(const QuranPod()
      // child: const MyApp(),
      );
}





// 'https://cdn.islamic.network/quran/audio-surah/128/${reciter.identifier}/$index.mp3',
