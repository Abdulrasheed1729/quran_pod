import 'dart:convert';

import 'package:flutter/services.dart';

class Surah {
  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
  });
  factory Surah.fromMap(Map<String, dynamic> json) {
    return Surah(
      number: json['number'] as int,
      name: json['name'] as String,
      englishName: json['englishName'] as String,
      englishNameTranslation: json['englishNameTranslation'] as String,
      numberOfAyahs: json['numberOfAyahs'] as int,
      revelationType: json['revelationType'] as String,
    );
  }

  factory Surah.fromJson(String source) =>
      Surah.fromMap(json.decode(source) as Map<String, dynamic>);
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final int numberOfAyahs;
  final String revelationType;

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
      'englishName': englishName,
      'englishNameTranslation': englishNameTranslation,
      'numberOfAyahs': numberOfAyahs,
      'revelationType': revelationType,
    };
  }

  String toJson() => jsonEncode(toMap());
}

Future<List<Surah>> fetchSurahsList() async {
  final jsonData = await rootBundle.loadString(
    'assets/surah.json',
  );

  final data = (json.decode(jsonData) as Map)['surahs'] as List;

  final surahsList = data
      .map(
        (e) => Surah.fromMap(e as Map<String, dynamic>),
      )
      .toList();

  return surahsList;
}
