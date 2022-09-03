// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_audio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranAudio _$QuranAudioFromJson(Map<String, dynamic> json) => QuranAudio(
      identifier: json['identifier'] as String,
      language: json['language'] as String,
      name: json['name'] as String,
      englishName: json['englishName'] as String,
      format: json['format'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$QuranAudioToJson(QuranAudio instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'language': instance.language,
      'name': instance.name,
      'englishName': instance.englishName,
      'format': instance.format,
      'type': instance.type,
    };
