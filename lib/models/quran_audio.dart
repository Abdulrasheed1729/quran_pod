import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quran_audio.g.dart';

@JsonSerializable()
class Quran extends Equatable {
  final String identifier;
  final String language;
  final String name;
  final String englishName;
  final String format;
  final String type;

  const Quran({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
  });

  factory Quran.fromJson(Map<String, dynamic> json) => _$QuranFromJson(json);

  Map<String, dynamic> toJson() => _$QuranToJson(this);

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
