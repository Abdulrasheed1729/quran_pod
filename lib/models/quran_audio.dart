import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quran_audio.g.dart';

@JsonSerializable()
class QuranAudio extends Equatable {
  final String identifier;
  final String language;
  final String name;
  final String englishName;
  final String format;
  final String type;

  const QuranAudio({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
  });

  factory QuranAudio.fromJson(Map<String, dynamic> json) =>
      _$QuranAudioFromJson(json);

  Map<String, dynamic> toJson() => _$QuranAudioToJson(this);

  @override
  List<Object?> get props => [
        identifier,
        language,
        name,
        englishName,
        format,
        type,
      ];
}

const String json = """
{"identifier":"ar.abdulazizazzahrani","language":"ar","name":"Abdulaziz Az-Zahrani","englishName":"Abdulaziz Az-Zahrani","format":"audio","type":"surahbysurah"}
""";
